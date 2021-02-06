import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pola_hidup_sehat/model/screenargument_model.dart';
import 'package:pola_hidup_sehat/utility/localnotify_manager.dart';

class SetNotificationScreen extends StatefulWidget {
  @override
  _SetNotificationScreenState createState() => _SetNotificationScreenState();
}

class _SetNotificationScreenState extends State<SetNotificationScreen> {

  @override
  void initState() {
    // TODO: implement initState

    localNotifyManager.setOnNotificationReceive(onNotificationReceive);

    super.initState();


  }

  onNotificationReceive(ReceiveNotification notification){
    print('Notification Received: ${notification.id}');

  }

  onNotificationClick(String payload){
    print('Payload $payload');
    Get.toNamed('/secondnotifscreen',arguments: ScreenArguments(payload,'',''));
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Set Notifikasi'),),
      body: Container(
        child: Center(
          child: FlatButton(
            onPressed: () async{
              await localNotifyManager.showDailyAtTimeNotification(11, 12, 00);
            },
            child: Text('Send Notif'),
          ),
        ),
      ),
    );
  }
}
