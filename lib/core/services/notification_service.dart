import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../constants/const_method.dart';

class NotificationService {
  static late final FlutterLocalNotificationsPlugin notificationService;

  static Future<void> initialize() async {
    notificationService = FlutterLocalNotificationsPlugin();
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    DarwinInitializationSettings iosInitializationSettings =
        const DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );

    final InitializationSettings settings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
    );

    await notificationService.initialize(
      settings,
    );
  }

  static Future<NotificationDetails> notificationDetails() async {
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails(
      "channelId",
      "channelName",
      channelDescription: "description",
      importance: Importance.max,
      priority: Priority.max,
      playSound: true,
    );

    const DarwinNotificationDetails iosNotificationDetails =
        DarwinNotificationDetails();

    return NotificationDetails(
        android: androidNotificationDetails, iOS: iosNotificationDetails);
  }

  static Future<NotificationDetails> notificationDetailsForOrder() async {
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails(
      "orderChannelId",
      "orderChannelName",
      channelDescription: "description",
      importance: Importance.max,
      priority: Priority.max,
      playSound: true,
    );

    const DarwinNotificationDetails iosNotificationDetails =
        DarwinNotificationDetails();

    return NotificationDetails(
        android: androidNotificationDetails, iOS: iosNotificationDetails);
  }

  static Future<void> showNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    final details = await notificationDetails();
    await notificationService.show(id, title, body, details);
  }

  static Future<void> showOrderNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    final details = await notificationDetailsForOrder();
    await notificationService.show(id, title, body, details);
  }

  static Future<void> cancelNotification() async {
    await notificationService.cancelAll();
  }

  static void onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) {
    logWarning("id $id");
  }
}
