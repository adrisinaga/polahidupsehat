import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width / 4,
      height: Get.height / 10,
      child: FittedBox(
        fit: BoxFit.fill,
        child: Image.asset('assets/bg.png'),
      ),
    );
  }
}
