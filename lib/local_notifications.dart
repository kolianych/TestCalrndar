import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

//Класс необходимый для работы с оповещениями
class NotificationService {
  final String id;
  NotificationService({required this.id});
  static final _notification = FlutterLocalNotificationsPlugin();

//инициализация
  static init() {
    _notification.initialize(const InitializationSettings(
        android: AndroidInitializationSettings('app_icon'),
        iOS: DarwinInitializationSettings()));
    tz.initializeTimeZones();
    _notification.cancelAll(); //очищаем все уведомления
  }

//метод записи в оповещенияя
  static scheduledNotification(
      String title, String body, DateTime datetime) async {
    var androidDetails = const AndroidNotificationDetails(
        'your channel id123', 'your channel name',
        importance: Importance.max, priority: Priority.high);
    var iosDetails = const DarwinNotificationDetails();
    var notificationDetails =
        NotificationDetails(android: androidDetails, iOS: iosDetails);

    await _notification.zonedSchedule(
      0,
      title,
      body,
      tz.TZDateTime.from(datetime, tz.local),
      notificationDetails,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }
}
