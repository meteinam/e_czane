import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationHelper {
  static final _notifications = FlutterLocalNotificationsPlugin();
  static Future initialize() async {
    const settingsAndroid = AndroidInitializationSettings('mipmap/ic_launcher');
    const settings = InitializationSettings(android: settingsAndroid);
    await _notifications.initialize(settings);
  }

  static Future _notificationDetails() async => const NotificationDetails(
        android: AndroidNotificationDetails(
          'eczane_notifier',
          'eczane_notifier channel',
          importance: Importance.max,
        ),
      );
  Future showNotification(
      {int id = 0,
      required String title,
      required String body,
      required DateTime scheduledTime}) async {
    await _notifications.zonedSchedule(id, title, body,
        _nextInstance(scheduledTime), await _notificationDetails(),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidScheduleMode: AndroidScheduleMode.alarmClock);
  }

  tz.TZDateTime _nextInstance(DateTime notificationTime) {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate =
        tz.TZDateTime.from(notificationTime, tz.local);

    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    print(scheduledDate);
    return scheduledDate;
  }

  Future cancelNotification(int id) async {
    await _notifications.cancel(id);
  }
}
