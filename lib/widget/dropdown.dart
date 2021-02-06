import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pola_hidup_sehat/controller/hitungBMI_controller.dart';
import 'package:pola_hidup_sehat/controller/register_controller.dart';
import 'package:pola_hidup_sehat/widget/text.dart';

class DropdownGolDarah extends StatefulWidget {
  DropdownGolDarah({Key key}) : super(key: key);

  @override
  _DropdownGolDarahState createState() => _DropdownGolDarahState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _DropdownGolDarahState extends State<DropdownGolDarah> {
  String dropdownValue = 'A';
  final RegisterController _registerController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white12),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextCustom(
                  text: "Pilih Golongan Darah",
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
              Container(
                width: Get.width / 2,
                child: DropdownButton<String>(
                  value: dropdownValue,
                  isDense: false,
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                  underline: Container(
                    height: 2,
                    color: Colors.deepOrange,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                    _registerController.dropdownValue = newValue;
                  },
                  items: <String>['A', 'B', 'AB', 'O']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Align(
                        alignment: Alignment.center,
                        child: TextCustom(
                          text: value,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          textOverflow: TextOverflow.fade,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DropdownAktivitas extends StatefulWidget {
  @override
  _DropdownAktivitasState createState() => _DropdownAktivitasState();
}

class _DropdownAktivitasState extends State<DropdownAktivitas> {
  String dropdownValue = 'Rendah';
  final HitungBmiController _hitungBmiController =
      Get.put(HitungBmiController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white12),
      child: Padding(
        padding: const EdgeInsets.only(left: 2.0, right: 2.0, top: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButton<String>(
              value: dropdownValue,
              iconSize: 18,
              elevation: 10,
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
              underline: Container(
                height: 2,
                // color: Colors.deepOrange,
              ),
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
                _hitungBmiController.dropdownValue = newValue;
              },
              isExpanded: true,
              items: <String>['Rendah', 'Sedang', 'Tinggi']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextCustom(
                      text: (value == 'Rendah')
                          ? 'Sedenter, minim aktivitas fisik, jarang/tak pernah berolahraga'
                          : (value == 'Sedang')
                              ? 'Cukup aktif, olahraga sedang, 3-5 hari perminggu'
                              : 'Sangat aktif, olahraga berat 6-7 hari seminggu',
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      textOverflow: TextOverflow.fade,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
