/// Firebase Push Notification Service
import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class LocalNotificationService {
  // Singleton Object - only one instance to this class
  static final LocalNotificationService _notifyService =
      LocalNotificationService._internal();

  factory LocalNotificationService() {
    return _notifyService;
  }
  LocalNotificationService._internal();

  // Creating channel ID
  static const channelID = '1234';
  static FlutterLocalNotificationsPlugin _flutterLocalNotificationPlugin =
      FlutterLocalNotificationsPlugin();

  // General Setting for notification - Andorid, IOS, LINUX, MAC
  Future<dynamic> init(BuildContext context) async {
    final AndroidInitializationSettings initSettingsForAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    // IOS notification settings
    final IOSInitializationSettings initSettingsForIOS =
        IOSInitializationSettings(
            requestSoundPermission: true,
            requestAlertPermission: false,
            requestBadgePermission: false);

    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initSettingsForAndroid, iOS: initSettingsForIOS);

    // load timezones
    tz.initializeTimeZones();

    // Initiate notification service
    await _flutterLocalNotificationPlugin.initialize(initializationSettings,
        onSelectNotification: (String route) {
      print('Notification payload: $route');
    });
  }

  AndroidNotificationDetails _androidNotificationDetails =
      AndroidNotificationDetails('provider', 'provider',
          playSound: true,
          importance: Importance.max,
          priority: Priority.high,
          ticker: 'ticker');

  // IOSNotificationDetails _iOSNotificationDetails = IOSNotificationDetails();

  // In order to show notification in your app use this following function
  Future<void> showNotification() async {
    await _flutterLocalNotificationPlugin.show(
      0,
      'Diwali Offer!!!',
      'Hurray! You have been ready to explore our services it seems.. enjoy!',
      NotificationDetails(
        android: _androidNotificationDetails,
      ),
      // iOS: _iOSNotificationDetails
    );
  }

  // In order to show notification in your app use this following function
  Future<void> showDynamicNotification(
      int id, String title, String desc) async {
    await _flutterLocalNotificationPlugin.show(
      id,
      title,
      desc,
      NotificationDetails(
        android: _androidNotificationDetails,
      ),
      // iOS: _iOSNotificationDetails
    );
  }

  // Scheduled Notification
  Future<void> scheduledDynamicNotification(
      int id, String title, String desc) async {
    await _flutterLocalNotificationPlugin.zonedSchedule(
      id, title, desc,
      tz.TZDateTime.now(tz.local).add(
        const Duration(seconds: 5),
      ),
      NotificationDetails(
        android: _androidNotificationDetails,
      ),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
      // iOS: _iOSNotificationDetails
    );
  }

  // Cancelling ID based notification
  Future<void> cancelNotification(int id) async {
    await _flutterLocalNotificationPlugin.cancel(id);
  }

  // Cancelling ID based notification
  Future<void> cancelAllNotification() async {
    await _flutterLocalNotificationPlugin.cancelAll();
  }

  static void createAndDisplayNotification(RemoteMessage message) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;

      const NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
          // "com.terramotors.provider",
          "provider",
          "provider",
          importance: Importance.max,
          priority: Priority.high,
        ),
      );

      /// pop up show
      await _flutterLocalNotificationPlugin.show(
        id,
        message.notification.title,
        message.notification.body,
        notificationDetails,
        payload: message.data["route"],
      );
    } on Exception catch (e) {
      print(e);
    }
  }
}
