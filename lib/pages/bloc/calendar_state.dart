import 'dart:collection';
import 'package:flutter_calendar_zadach/model/event.dart';

//State для управления состояниями календаря
abstract class CalendarState {
  const CalendarState();
}

class CalendarLoading extends CalendarState {
  const CalendarLoading();
}

class CalendarLoaded extends CalendarState {
  final LinkedHashMap<DateTime, List<Event>> events;
  final DateTime? selectedDay;

  CalendarLoaded(this.events, {this.selectedDay});
}

class CalendarError extends CalendarState {
  final String message;

  CalendarError(this.message);
}
