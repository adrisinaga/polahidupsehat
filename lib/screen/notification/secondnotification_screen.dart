import 'package:flutter/material.dart';
import 'package:pola_hidup_sehat/model/screenargument_model.dart';

class SecondNotificationScreen extends StatefulWidget {

  @override
  _SecondNotificationScreenState createState() =>
      _SecondNotificationScreenState();
}

class _SecondNotificationScreenState extends State<SecondNotificationScreen> {

  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Screen Second'),
      ),
      body: Center(child: Text(args.judulAwalDefinisi??'No notif')),
    );
  }
}
