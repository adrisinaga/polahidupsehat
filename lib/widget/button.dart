import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MaterialButtonCustom extends StatelessWidget {
  final Color color;
  final Function onTap;
  final String buttonText;

  const MaterialButtonCustom({Key key, this.color, this.onTap, this.buttonText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: color,
      splashColor: Colors.white,
      height: 45,
      minWidth: Get.width / 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        buttonText,
        style: GoogleFonts.exo2(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: onTap,
    );
  }
}
