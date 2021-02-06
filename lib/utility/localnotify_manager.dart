import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:io' show Platform;
import 'package:rxdart/subjects.dart';

class LocalNotifyManager {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  var initSetting;

  BehaviorSubject<ReceiveNotification> get didReceiveLocalNotificationSubject =>
      BehaviorSubject<ReceiveNotification>();

  LocalNotifyManager.init() {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    if (Platform.isIOS) {
      requestIOSPermission();
    }
    initializePlatform();
  }

  requestIOSPermission() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        .requestPermissions(alert: true, badge: true, sound: true);
  }

  initializePlatform() {
    var initSettingAndroid = AndroidInitializationSettings('app_notification');
    var initSettingIOS = IOSInitializationSettings(
        requestSoundPermission: true,
        requestBadgePermission: true,
        requestAlertPermission: true,
        onDidReceiveLocalNotification: (id, title, body, payload) async {
          ReceiveNotification notification = ReceiveNotification(
              id: id, title: title, body: body, payload: payload);
          didReceiveLocalNotificationSubject.add(notification);
        });
    initSetting = InitializationSettings(
        android: initSettingAndroid, iOS: initSettingIOS);
  }

  setOnNotificationReceive(Function onNotificationReceive) {
    didReceiveLocalNotificationSubject.listen((notification) {
      onNotificationReceive(notification);
    });
  }

  setOnNotificationClick(Function onNotificationClick) async {
    await flutterLocalNotificationsPlugin.initialize(initSetting,
        onSelectNotification: (String payload) async {
      onNotificationClick(payload);
    });
  }

  Future<void> showNotification() async {
    var androidChannel = AndroidNotificationDetails(
      'CHANNEL_ID',
      'CHANNEL_NAME',
      'CHANNEL_DESCRIPTION',
      importance: Importance.max,
      playSound: true,
    );
    var iosChannel = IOSNotificationDetails();
    var platformChannel =
        NotificationDetails(android: androidChannel, iOS: iosChannel);
    await flutterLocalNotificationsPlugin.show(
      0,
      'Test Notif',
      'Test Body Notif',
      platformChannel,
      payload: 'New Payload',
    );
  }

  Future<void> scheduleNotification() async {
    var scheduleNotificationDateTime = DateTime.now().add(Duration(seconds: 5));
    var androidChannel = AndroidNotificationDetails(
      'CHANNEL_ID',
      'CHANNEL_NAME',
      'CHANNEL_DESCRIPTION',
      importance: Importance.max,
      playSound: true,
    );
    var iosChannel = IOSNotificationDetails();
    var platformChannel =
        NotificationDetails(android: androidChannel, iOS: iosChannel);
    await flutterLocalNotificationsPlugin.schedule(
      0,
      'Schedule Test Notif',
      'Isi Schedule Test Body Notif',
      scheduleNotificationDateTime,
      platformChannel,
      payload: 'New Payload',
    );
  }

  Future<void> showDailyAtTimeNotification(int hour,int minute, int second) async {
    var time = Time(hour, minute, second);
    var androidChannel = AndroidNotificationDetails(
      'CHANNEL_ID',
      'CHANNEL_NAME',
      'CHANNEL_DESCRIPTION',
      importance: Importance.max,
      playSound: true,
      timeoutAfter: 5000,
      enableLights: true,

      ///add if you need
      // sound: RawResourceAndroidNotificationSound('notification_sound'),
      // icon: 'icon_notification_replace',
      // largeIcon: DrawableResourceAndroidBitmap('icon_large_notification'),
    );
    // var iosChannel = IOSNotificationDetails();
    var platformChannel =
        NotificationDetails(android: androidChannel);
    await flutterLocalNotificationsPlugin.showDailyAtTime(
      0,
      'Daily test title ${time.hour}-${time.minute}-${time.second}',
      'Test Body Notif',
      time,
      platformChannel,
      payload: 'Show daily notification',
    );
  }
}

LocalNotifyManager localNotifyManager = LocalNotifyManager.init();

class ReceiveNotification {
  final int id;
  final String title;
  final String body;
  final String payload;

  ReceiveNotification({
    @required this.id,
    @required this.title,
    @required this.body,
    @required this.payload,
  });
}
