import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFormFieldCustom extends StatelessWidget {
  final String hintText;
  final bool enabled;
  final TextInputType textInputType;
  final TextEditingController textEditingController;

  TextFormFieldCustom(
      {this.hintText,this.enabled, this.textInputType, this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      keyboardType: textInputType,
      enabled: enabled,
      decoration: InputDecoration(
        fillColor: Colors.grey[200],
        filled: true,
        hintText: hintText,
        hintStyle: GoogleFonts.exo2(
          fontSize: 16,
          color: Colors.grey,
          fontWeight: FontWeight.normal,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.transparent, width: 0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.transparent, width: 0),
        ),
      ),
      style: GoogleFonts.exo2(
          fontSize: 16, color: Colors.black87, fontWeight: FontWeight.normal),
      validator: (value) => value.trim().isEmpty ? '$hintText harus diisi' : null,
    );
  }
}
