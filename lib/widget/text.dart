import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pola_hidup_sehat/widget/color.dart';

class TextCustom extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign alignment;
  final TextOverflow textOverflow;
  final int maxLines;

  TextCustom({this.text,this.fontSize,this.color,this.fontWeight, this.alignment,this.textOverflow,this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.exo2(
        fontSize: fontSize,
        color: color??AppColor.textButtonBlack,
        fontWeight: fontWeight,
      ),
      overflow: textOverflow,
      textAlign: alignment,
      maxLines: maxLines,
    );
  }
}
