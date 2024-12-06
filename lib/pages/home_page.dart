import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_calendar_zadach/pages/bloc/calendar_bloc.dart';
import 'package:flutter_calendar_zadach/pages/bloc/calendar_event.dart';
import 'package:flutter_calendar_zadach/pages/bloc/calendar_state.dart';
import 'package:flutter_calendar_zadach/generated/l10n.dart';
import 'package:flutter_calendar_zadach/pages/add_edit_event.dart';
import 'package:flutter_calendar_zadach/widgets/event_item.dart';
import 'package:table_calendar/table_calendar.dart';

//страница календаря со списком в соответствии с выбранной датой
class MyHomePage extends StatefulWidget {
  final String? id;
  const MyHomePage({super.key, this.id});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late DateTime _focusedDay;
  late DateTime _firstDay;
  late DateTime _lastDay;
  late DateTime _selectedDay;

  @override
  void initState() {
    super.initState();
    _focusedDay = DateTime.now();
    _firstDay = DateTime.now().subtract(const Duration(days: 1000));
    _lastDay = DateTime.now().add(const Duration(days: 1000));
    _selectedDay = _focusedDay;

    loadEvents();
  }

  void loadEvents() {
    context.read<CalendarBloc>().add(LoadEvents(widget.id!, _selectedDay));
  }

  @override
  Widget build(BuildContext context) {
    final calendarBloc = BlocProvider.of<CalendarBloc>(context);
    return Scaffold(
      body: BlocBuilder<CalendarBloc, CalendarState>(
        builder: (context, state) {
          if (state is CalendarLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CalendarLoaded) {
            final events = state.events;
            return Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width > 500 ? 500.0 : null,
                  child: TableCalendar(
                    locale: 'ru_RU',
                    headerStyle: const HeaderStyle(formatButtonVisible: false),
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    eventLoader: (day) => events[day] ?? [],
                    focusedDay: _focusedDay,
                    firstDay: _firstDay,
                    lastDay: _lastDay,
                    onPageChanged: (focusedDay) {
                      setState(() {
                        _focusedDay = focusedDay;
                        _selectedDay = DateTime(
                          focusedDay.year,
                          focusedDay.month,
                          _selectedDay.day >
                                  DateTime(focusedDay.year,
                                          focusedDay.month + 1, 0)
                                      .day
                              ? DateTime(
                                      focusedDay.year, focusedDay.month + 1, 0)
                                  .day
                              : _selectedDay.day,
                        );
                      });
                    },
                    selectedDayPredicate: (day) {
                      return calendarBloc.isSameDay(day, _selectedDay);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                      });
                    },
                  ),
                ),
                // Список событий
                Expanded(
                  child: ListView(
                    children: [
                      ...events[_selectedDay]?.map((event) => EventItem(
                                event: event,
                                onTap: () async {
                                  final res = await Navigator.push<bool>(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => AddEditEvent(
                                          id: widget.id,
                                          firstDate: _firstDay,
                                          lastDate: _lastDay,
                                          event: event),
                                    ),
                                  );
                                  if (res ?? false) {
                                    if (context.mounted) {
                                      context.read<CalendarBloc>().add(
                                          LoadEvents(widget.id!, event.date));
                                    }
                                  }
                                },
                                onDelete: () async {
                                  final delete = await showDialog<bool>(
                                    context: context,
                                    builder: (_) => AlertDialog(
                                      title: Text(S.of(context).deleteEvent),
                                      content: const Text(
                                          "Are you sure you want to delete?"),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, false),
                                          style: TextButton.styleFrom(
                                            foregroundColor: Colors.black,
                                          ),
                                          child: Text(S.of(context).no),
                                        ),
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, true),
                                          style: TextButton.styleFrom(
                                            foregroundColor: Colors.red,
                                          ),
                                          child: Text(S.of(context).yes),
                                        ),
                                      ],
                                    ),
                                  );

                                  if (delete ?? false) {
                                    if (context.mounted) {
                                      context.read<CalendarBloc>().add(
                                          DeleteEvent(widget.id!, event.id));
                                    }
                                  }
                                },
                              )) ??
                          [
                            ListTile(
                                title: Center(
                                    child: Text(S
                                        .of(context)
                                        .thereAreNoEventsForThisDay))),
                          ],
                    ],
                  ),
                ),
              ],
            );
          } else if (state is CalendarError) {
            return Center(child: Text(S.of(context).errorState(state.message)));
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(side: BorderSide(color: Colors.purple)),
        onPressed: () async {
          final result = await Navigator.push<bool>(
            context,
            MaterialPageRoute(
              builder: (_) => AddEditEvent(
                id: widget.id,
                firstDate: _firstDay,
                lastDate: _lastDay,
                selectedDate: _selectedDay,
              ),
            ),
          );
          if (result ?? false) {
            loadEvents();
          }
        },
        elevation: 0,
        child: const Icon(Icons.add),
      ),
    );
  }
}
