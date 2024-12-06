import 'package:flutter_calendar_zadach/model/event.dart';

//этот контроллер необходим для преобразования значений из базы данных
//в базе хранятся интовые ключи (format), с помощью которых мы высчитываем дату (вермя) для оповещения
//0 - минуты
//1 - часы
//2 - дни
class DataTimeController {
  static DateTime calculateNotificationDate(Event event) {
    final DateTime originalDate = event.date;
    DateTime dateNonification;

    switch (event.format) {
      case 0:
        dateNonification = originalDate
            .subtract(Duration(minutes: event.upcomingNotification));
        break;
      case 1:
        dateNonification =
            originalDate.subtract(Duration(hours: event.upcomingNotification));
        break;
      case 2:
        dateNonification =
            originalDate.subtract(Duration(days: event.upcomingNotification));
        break;
      default:
        dateNonification = originalDate; // Можно задать значение по умолчанию
    }

    return dateNonification;
  }
}
