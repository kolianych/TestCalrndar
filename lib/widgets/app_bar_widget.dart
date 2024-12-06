import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_calendar_zadach/pages/bloc/calendar_bloc.dart';
import 'package:flutter_calendar_zadach/pages/bloc/calendar_state.dart';
import 'package:flutter_calendar_zadach/generated/l10n.dart';
import 'package:flutter_calendar_zadach/local_notifications.dart';
import 'package:flutter_calendar_zadach/localizationsBloc/locale_bloc.dart';
import 'package:flutter_calendar_zadach/pages/events_list_page.dart';
import 'package:flutter_calendar_zadach/pages/home_page.dart';
import 'package:flutter_calendar_zadach/themeBloc/theme_bloc.dart';

//Виджет Appbar с двумя Tabs для страницы календаря и списка событий
class AppBarWidget extends StatelessWidget {
  final String id;

  const AppBarWidget({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    bool hasLoggedEvents = false;
    NotificationService.init(); //инициализация Notification (для оповешений)
    // Проверяем состояние BLoC
    BlocProvider.of<CalendarBloc>(context).stream.listen((state) {
      if (state is CalendarLoaded && !hasLoggedEvents) {
        Utils.logEventDates(
            state.events); // Вызываем метод записи в оповещения спискасобытий
        hasLoggedEvents =
            true; // Устанавливаем флаг в true после первого вызова
      }
    });
    return DefaultTabController(
      length: 2, // Количество вкладок
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).cybpeApp),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: const Icon(Icons.language),
              onPressed: () {
                final localeBloc = BlocProvider.of<LocaleBloc>(context);
                final newLocale = localeBloc.state.locale.languageCode == 'en'
                    ? const Locale('ru')
                    : const Locale('en');
                localeBloc.add(ChangeLocale(newLocale)); // Изменение локали
              },
            ),
            IconButton(
              icon: const Icon(Icons.brightness_6),
              onPressed: () {
                context.read<ThemeBloc>().add(ThemeEvent.toggle);
              },
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(text: S.of(context).eventsCalendar),
              Tab(text: S.of(context).listOfEvents),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            MyHomePage(
              id: id,
            ), // страница календаря
            EventsListPage(
              id: id,
            ), // страница списка
          ],
        ),
      ),
    );
  }
}
