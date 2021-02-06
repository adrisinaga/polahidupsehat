import 'package:flutter/material.dart';
import 'package:pola_hidup_sehat/screen/pemeriksaan_lab/satuanpemeriksaanlab_screen.dart';
import 'package:pola_hidup_sehat/widget/color.dart';
import 'package:pola_hidup_sehat/widget/text.dart';

class PemeriksaanLabScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      appBar: AppBar(
        title: TextCustom(
          text: 'Pemeriksaan Lab',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: ListView(
            children: [
              TextCustom(
                  text: 'Hematologi Lengkap',
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.black87),
              Wrap(
                spacing: 10,
                children: [
                  FlatButtonCustom(text: "Hemoglobin", color: Colors.amberAccent),
                  FlatButtonCustom(text: "Hematokrit", color: Colors.amberAccent),
                  FlatButtonCustom(text: "Leukosit", color: Colors.amberAccent),
                  FlatButtonCustom(
                      text: "Trombosit", color: Colors.amberAccent),
                  FlatButtonCustom(text: "MCV", color: Colors.amberAccent),
                  FlatButtonCustom(text: "MCH", color: Colors.amberAccent),
                  FlatButtonCustom(
                      text: "MCHC", color: Colors.amberAccent),
                  FlatButtonCustom(text: "Basofil", color: Colors.amberAccent),
                  FlatButtonCustom(
                      text: "Eosinofil", color: Colors.amberAccent),
                  FlatButtonCustom(text: "Stab", color: Colors.amberAccent),
                  FlatButtonCustom(text: "Neutrofil", color: Colors.amberAccent),
                  FlatButtonCustom(text: "Limfosit", color: Colors.amberAccent),
                  FlatButtonCustom(text: "Monosit", color: Colors.amberAccent),
                  FlatButtonCustom(text: "LED", color: Colors.amberAccent),
                  FlatButtonCustom(text: "Eritrosit", color: Colors.amberAccent),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              TextCustom(
                  text: "Cholesterol LDL Direk",
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.black87),
              Wrap(
                spacing: 10,
                children: [
                  FlatButtonCustom(
                      text: "Kolesterol LDL", color: Colors.orange),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              TextCustom(
                  text: "Cholesterol HDL",
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.black87),
              Wrap(
                spacing: 10,
                children: [
                  FlatButtonCustom(
                      text: "Kolesterol HDL", color: Colors.lightBlueAccent),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              TextCustom(
                  text: "APTT",
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.black87),
              Wrap(
                spacing: 10,
                children: [
                  FlatButtonCustom(
                      text: "APTT", color: Colors.cyanAccent),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              TextCustom(
                  text: "Glukosa Sewaktu",
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.black87),
              Wrap(
                spacing: 10,
                children: [
                  FlatButtonCustom(text: "Glukosa Sewaktu", color: Colors.lime),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              TextCustom(
                  text: "Kreatinin",
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.black87),
              Wrap(
                spacing: 10,
                children: [
                  FlatButtonCustom(text: "Kreatinin", color: Colors.greenAccent),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class FlatButtonCustom extends StatelessWidget {
  final String text;
  final Color color;

  FlatButtonCustom({this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return Flex(
      mainAxisSize: MainAxisSize.min,
      direction: Axis.vertical,
      children: [
        FlatButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => SatuanPemeriksaanLabScreen(type: text,color: color,),
              ),
            );
          },
          child: Text(text),
          color: color,
        ),
      ],
    );
  }
}
