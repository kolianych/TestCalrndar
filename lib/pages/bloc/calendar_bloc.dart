import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_calendar_zadach/pages/bloc/calendar_event.dart';
import 'package:flutter_calendar_zadach/pages/bloc/calendar_state.dart';
import 'package:flutter_calendar_zadach/controller/data_time_controller.dart';
import 'package:flutter_calendar_zadach/local_notifications.dart';
import 'package:flutter_calendar_zadach/model/event.dart';

//Bloc для управления состояниями календаря
class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  CalendarBloc() : super(const CalendarLoading()) {
    on<LoadEvents>(_onLoadEvents);
    on<DeleteEvent>(_onDeleteEvent);
    on<UpdateSelectedDay>(_onUpdateSelectedDay);
  }

  Future<void> _onLoadEvents(
      LoadEvents event, Emitter<CalendarState> emit) async {
    emit(const CalendarLoading());
    try {
      final events = await loadEvents(event.collectionId, event.focusedDay);
      final linkedEvents = LinkedHashMap<DateTime, List<Event>>(
        equals: isSameDay,
        hashCode: getHashCode,
      );

      // Заполнение LinkedHashMap
      events.forEach((key, value) {
        linkedEvents[key] = value;
      });

      emit(CalendarLoaded(linkedEvents));
    } catch (e) {
      emit(CalendarError(e.toString()));
    }
  }

  Future<void> _onDeleteEvent(
      DeleteEvent event, Emitter<CalendarState> emit) async {
    emit(const CalendarLoading());

    try {
      await FirebaseFirestore.instance
          .collection(event.collectionId)
          .doc(event.eventId)
          .delete();

      // После удаления можно снова загрузить события
      final updatedEvents = await loadEventsNew(
          event.collectionId, DateTime.now()); // Получаем обновленные события
      emit(CalendarLoaded(updatedEvents));
    } catch (e) {
      emit(CalendarError(e.toString()));
    }
  }

  Future<LinkedHashMap<DateTime, List<Event>>> loadEventsNew(
      String collectionId, DateTime date) async {
    final snapshot =
        await FirebaseFirestore.instance.collection(collectionId).get();

    // Создаем LinkedHashMap для хранения событий
    final events = LinkedHashMap<DateTime, List<Event>>(
      equals: isSameDay,
      hashCode: getHashCode,
    );

    for (var doc in snapshot.docs) {
      final event = Event.fromFirestore(doc);
      final eventDate = event.date;

      // Добавляем событие в LinkedHashMap
      if (!events.containsKey(eventDate)) {
        events[eventDate] = [];
      }
      events[eventDate]!.add(event);
    }

    return events;
  }

  Future<void> _onUpdateSelectedDay(
      UpdateSelectedDay event, Emitter<CalendarState> emit) async {
    if (state is CalendarLoaded) {
      final currentState = state as CalendarLoaded;
      emit(CalendarLoaded(currentState.events, selectedDay: event.selectedDay));
    }
  }

  Future<Map<DateTime, List<Event>>> loadEvents(
      String collectionId, DateTime focusedDay) async {
    Map<DateTime, List<Event>> events = {};

    final firstDay = DateTime(focusedDay.year, focusedDay.month, 1);
    final lastDay = DateTime(focusedDay.year, focusedDay.month + 1, 0);

    final snap = await FirebaseFirestore.instance
        .collection(collectionId)
        .where('date', isGreaterThanOrEqualTo: firstDay)
        .where('date', isLessThanOrEqualTo: lastDay)
        .withConverter<Event>(
          fromFirestore: (snapshot, _) => Event.fromFirestore(snapshot),
          toFirestore: (event, _) => event.toFirestore(),
        )
        .get();

    for (var doc in snap.docs) {
      final event = doc.data();
      final day =
          DateTime.utc(event.date.year, event.date.month, event.date.day);

      if (events[day] == null) {
        events[day] = [];
      }
      events[day]!.add(event);
    }

    return events;
  }

  bool isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  int getHashCode(DateTime date) {
    return date.year ^ date.month ^ date.day;
  }
}

//при загрузке приложения мы получем список событий, которые мы записываем в оповещения
//каждый раз при загрузке, мы должны актуализировать список оповещений
class Utils {
  static void logEventDates(Map<DateTime, List<Event>> events) {
    events.forEach((date, eventList) {
      for (var event in eventList) {
        // Используем DataTimeController для вычисления dateNonification
        final DateTime dateNonification =
            DataTimeController.calculateNotificationDate(event);

        // Проверяем, что dateNonification не меньше текущего времени
        if (dateNonification.isAfter(DateTime.now()) && !event.check) {
          NotificationService.scheduledNotification(
              event.title, event.description ?? '', dateNonification);
        }
      }
    });
  }
}
