import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_calendar_zadach/pages/bloc/calendar_bloc.dart';
import 'package:flutter_calendar_zadach/pages/bloc/calendar_event.dart';
import 'package:flutter_calendar_zadach/pages/bloc/calendar_state.dart';
import 'package:flutter_calendar_zadach/generated/l10n.dart';
import 'package:flutter_calendar_zadach/pages/add_edit_event.dart';
import 'package:flutter_calendar_zadach/widgets/event_item.dart';

//страница отображения списка с скобытиями, а также фильтром по цвету (цвет зависит от состояния события)
class EventsListPage extends StatefulWidget {
  final String? id;
  const EventsListPage({super.key, this.id});

  @override
  EventsListPageState createState() => EventsListPageState();
}

class EventsListPageState extends State<EventsListPage> {
  final DateTime _firstDay =
      DateTime.now().subtract(const Duration(days: 1000));
  final DateTime _lastDay = DateTime.now().add(const Duration(days: 1000));

  String? _selectedColor;

  @override
  void initState() {
    super.initState();
    final calendarBloc = BlocProvider.of<CalendarBloc>(context);
    calendarBloc
        .add(LoadEvents(widget.id!, DateTime.now())); // Загрузка событий
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).events),
        automaticallyImplyLeading: false,
        actions: [
          GestureDetector(
            onTap: () {
              setState(() {
                _selectedColor = null; // Сброс фильтра
              });
              context.read<CalendarBloc>().add(LoadEvents(
                  widget.id!, DateTime.now())); // Перезагрузка всех событий
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.blue, width: 2),
              ),
              child: Center(
                child: Text(
                  S.of(context).all,
                  style: const TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          // Кнопки для фильтрации по цвету
          _colorCircleButton(Colors.red, 'red'),
          _colorCircleButton(Colors.yellow, 'yellow'),
          _colorCircleButton(Colors.green, 'green'),
        ],
      ),
      body: BlocBuilder<CalendarBloc, CalendarState>(
        builder: (context, state) {
          if (state is CalendarLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CalendarLoaded) {
            final events = state.events;

            // Извлечение всех событий в список
            final allEvents =
                events.values.expand((eventList) => eventList).toList();

            // Фильтрация событий по выбранному цвету
            final filteredEvents = _selectedColor == null
                ? allEvents
                : allEvents
                    .where((event) => event.getColor() == _selectedColor)
                    .toList();

            // Преобразуем все события в список для отображения
            final eventList = filteredEvents.map((event) {
              return EventItem(
                event: event,
                onTap: () async {
                  final res = await Navigator.push<bool>(
                    context,
                    MaterialPageRoute(
                      builder: (_) => AddEditEvent(
                        id: widget.id,
                        firstDate: _firstDay,
                        lastDate: _lastDay,
                        event: event,
                      ),
                    ),
                  );
                  if (res ?? false) {
                    if (context.mounted) {
                      context
                          .read<CalendarBloc>()
                          .add(LoadEvents(widget.id!, event.date));
                    }
                  }
                },
                onDelete: () async {
                  final delete = await showDialog<bool>(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text(S.of(context).deleteEvent),
                      content: Text(S.of(context).areYouSureYouWantToDelete),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, false),
                          child: Text(S.of(context).yes),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, true),
                          child: Text(S.of(context).no),
                        ),
                      ],
                    ),
                  );
                  if (delete ?? false) {
                    if (context.mounted) {
                      context
                          .read<CalendarBloc>()
                          .add(DeleteEvent(widget.id!, event.id));
                    }
                  }
                },
              );
            }).toList();

            return ListView(
              children: eventList.isNotEmpty
                  ? eventList
                  : [
                      ListTile(
                          title: Center(
                              child: Text(
                                  S.of(context).thereAreNoEventsToDisplay)))
                    ],
            );
          } else if (state is CalendarError) {
            return Center(child: Text(S.of(context).errorState(state.message)));
          }
          return Container();
        },
      ),
    );
  }

  // Метод для создания кругов
  Widget _colorCircleButton(Color color, String colorName) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedColor = colorName; // Обновляем выбранный цвет
        });
        context.read<CalendarBloc>().add(LoadEvents(widget.id!,
            DateTime.now())); // Перезагрузка событий с новым фильтром
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
