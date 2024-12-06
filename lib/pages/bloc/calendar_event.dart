//Event для управления состояниями календаря
class CalendarEvent {}

class LoadEvents extends CalendarEvent {
  final String collectionId;
  final DateTime focusedDay;

  LoadEvents(this.collectionId, this.focusedDay);
}

class DeleteEvent extends CalendarEvent {
  final String collectionId;
  final String eventId;

  DeleteEvent(this.collectionId, this.eventId);
}

class UpdateSelectedDay extends CalendarEvent {
  final DateTime focusedDay;
  final DateTime selectedDay;

  UpdateSelectedDay(this.focusedDay, this.selectedDay);
}
