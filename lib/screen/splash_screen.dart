import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pola_hidup_sehat/controller/splashscreen_controller.dart';
import 'dart:async';

import 'package:pola_hidup_sehat/screen/main_menu.dart';
import 'package:pola_hidup_sehat/widget/color.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  final SplashScreenController _splashScreenController =
      Get.put(SplashScreenController());

  @override
  void initState() {
    _mockCheckForSession().then((value) {
      _splashScreenController.checkUserLogin();
      // _navigateToLogin();
    });
    super.initState();

    var initializationSettingsAndroid =
        AndroidInitializationSettings('app_notification');
    var initializationSettingsIOs = IOSInitializationSettings();
    var initSetttings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOs);

    flutterLocalNotificationsPlugin.initialize(initSetttings,
        onSelectNotification: onSelectNotification);
    showNotificationWeeklySunday();
    showNotificationDailyTester();
    showNotificationDailyAt06();
    showNotificationDailyAt12();
    showNotificationDailyAt18();
  }

  Future<bool> _mockCheckForSession() async {
    await Future.delayed(Duration(milliseconds: 4000), () {});
    return true;
  }

  /*
   * @description _navigateToLogin untuk pindah ke page login
   */

  void _navigateToLogin() {
    Get.offAllNamed('/login');
  }

  @override
  Widget build(BuildContext context) {
    final double _height = MediaQuery.of(context).size.height;
    final double _width = MediaQuery.of(context).size.width;

    return Material(
      color: AppColor.primary,
      child: SafeArea(
        bottom: true,
        minimum: EdgeInsets.only(top: _height * 0.12),
        child: Container(
          child: Column(
            children: <Widget>[
              ClipOval(
                child: Container(
                  color: Colors.white,
                  height: _height * 0.15,
                  width: _height * 0.15,
                  child: Image.asset(
                    "assets/bg.png",
                  ),
                ),
              ),
              SizedBox(
                height: _height * 0.04,
              ),
              Container(
                height: _height * 0.08,
                width: _width,
                color: Colors.deepOrangeAccent,
                child: Center(
                  child: Text(
                    "Pola Hidup Sehat",
                    style: TextStyle(
                        fontSize: 37,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                ),
              ),
              Align(
                heightFactor: _height * 0.0080,
                alignment: Alignment.center,
                child: CupertinoTheme(
                  data: CupertinoTheme.of(context)
                      .copyWith(brightness: Brightness.dark),
                  child: CupertinoActivityIndicator(
                    // ignore: deprecated_member_use
                    iOSVersionStyle:
                        CupertinoActivityIndicatorIOSVersionStyle.iOS13,
                    radius: 30,
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "© Pola Hidup Sehat. 2021 All Right Reserved.",
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  showNotificationWeeklySunday() async {
    var time = Time(05, 00, 0);
    var androidPlatformChannelSpecifics =
        AndroidNotificationDetails('id', 'name', 'description');
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
        0,
        '05.00 : Jadwal Olahraga',
        'Lakukan olahraga rutin mulai dari pukul 05.00-06.00. Kamu bisa mulai dari jogging, dan peregangan badan lainnya.',
        Day.sunday,
        time,
        platformChannelSpecifics,
        payload: 'Week');
  }

  showNotificationDailyTester() async {
    var time = Time(18, 50, 0);
    var androidPlatformChannelSpecifics =
        AndroidNotificationDetails('id', 'name', 'description');
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.showDailyAtTime(
      10,
      '18.50 : Tester aja',
      'Jadwal ini untuk sekedar testing',
      time,
      platformChannelSpecifics,
      payload: 'Testing',
    );
  }

  showNotificationDailyAt06() async {
    var time = Time(06, 00, 0);
    var androidPlatformChannelSpecifics =
        AndroidNotificationDetails('id', 'name', 'description');
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.showDailyAtTime(
      1,
      '06.00 : Jadwal Sarapan',
      'Jadwal sarapan Pagi disarankan mengonsumsi roti atau oatmeal.',
      time,
      platformChannelSpecifics,
      payload: 'Sarapan',
    );
  }

  showNotificationDailyAt12() async {
    var time = Time(12, 00, 0);
    var androidPlatformChannelSpecifics =
        AndroidNotificationDetails('id', 'name', 'description');
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.showDailyAtTime(
        2,
        '12.00 : Jadwal Makan Siang',
        'Jadwal makan siang disarankan mengonsumsi nasi dengan porsi normal disertai sayuran dan protein seperti ikan atau telur.',
        time,
        platformChannelSpecifics,
        payload: 'Siang');
  }

  showNotificationDailyAt18() async {
    var time = Time(18, 00, 0);
    var androidPlatformChannelSpecifics =
        AndroidNotificationDetails('id', 'name', 'description');
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.showDailyAtTime(
        3,
        '18.00 : Jadwal Makan Malam',
        'Jadwal makan malam disarankan untuk mengurangi kadar gula seperti mengurangi porsi nasi atau menggantinya dengan buah.',
        time,
        platformChannelSpecifics,
        payload: 'Malam');
  }

  Future onSelectNotification(String payload) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return MainMenu();
        },
      ),
    );
  }
}
