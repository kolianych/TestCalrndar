import 'package:cloud_firestore/cloud_firestore.dart';

//Модель класса Event для событий

//title - заголовок
//description - описание
//date - финичная дата
//id - идентификатор (в качестве идентификации я использовал Email опользователя)
//check - отметка о выполнении
//upcomingNotification - сдесь указывается значение для запланированного оповещения
//format - формат для расчета запланированного оповещения
//getColor() метод для определения цвета для оповещений

class Event {
  final String title;
  final String? description;
  final DateTime date;
  final String id;
  final bool check;
  final int upcomingNotification;
  final int format;
  Event(
      {required this.title,
      this.description,
      required this.date,
      required this.id,
      required this.check,
      required this.upcomingNotification,
      required this.format});

  String getColor() {
    final DateTime originalDate = date;
    DateTime dateNonification;
    switch (format) {
      case 0:
        dateNonification =
            originalDate.subtract(Duration(minutes: upcomingNotification));
        break;
      case 1:
        dateNonification =
            originalDate.subtract(Duration(hours: upcomingNotification));
        break;
      case 2:
        dateNonification =
            originalDate.subtract(Duration(days: upcomingNotification));
        break;
      default:
        dateNonification = originalDate; // Можно задать значение по умолчанию
    }

    if (date.isBefore(DateTime.now()) && !check) {
      return 'red';
    } else if (dateNonification.isBefore(DateTime.now()) && !check) {
      return 'yellow';
    } else {
      return 'green';
    }
  }

  factory Event.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,
      [SnapshotOptions? options]) {
    final data = snapshot.data()!;
    return Event(
      date: data['date'].toDate(),
      title: data['title'],
      description: data['description'],
      id: snapshot.id,
      check: data['check'],
      upcomingNotification: data['upcomingNotification'],
      format: data['format'],
    );
  }

  Map<String, Object?> toFirestore() {
    return {
      "date": Timestamp.fromDate(date),
      "title": title,
      "description": description,
      "check": check,
      "upcomingNotification": upcomingNotification,
      "format": format,
    };
  }
}
