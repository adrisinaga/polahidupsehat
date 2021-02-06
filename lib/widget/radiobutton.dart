import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pola_hidup_sehat/controller/register_controller.dart';
import 'package:pola_hidup_sehat/widget/text.dart';

enum Gender { lakilaki, perempuan }

/// This is the stateful widget that the main application instantiates.
class RadioButtonGender extends StatefulWidget {
  RadioButtonGender({Key key}) : super(key: key);

  @override
  _RadioButtonGenderState createState() => _RadioButtonGenderState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _RadioButtonGenderState extends State<RadioButtonGender> {
  Gender _character = Gender.lakilaki;
  final RegisterController _registerController = Get.put(RegisterController());

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white54, borderRadius: BorderRadius.circular(30)),
      child: Card(elevation: 2,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextCustom(
              text: "Pilih Gender",
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 40.0),
              child: ListTile(
                title: TextCustom(
                  text: 'Laki-laki',
                  fontSize: 17,
                ),
                trailing: Radio(
                  value: Gender.lakilaki,
                  groupValue: _character,
                  onChanged: (Gender value) {
                    setState(() {
                      _character = value;
                    });
                    _registerController.character = value.toString();
                    print('character terpilih ::: ' +
                        _registerController.character);
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 40.0),
              child: ListTile(
                title: TextCustom(
                  text: 'Perempuan',
                  fontSize: 17,
                ),
                trailing: Radio(
                  value: Gender.perempuan,
                  groupValue: _character,
                  onChanged: (Gender value) {
                    setState(() {
                      _character = value;
                    });
                    _registerController.character = value.toString();
                    print('character terpilih ::: ' +
                        _registerController.character);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum RiwayatJantung { iya, tidak }

/// This is the stateful widget that the main application instantiates.
class RadioButtonRiwayatJantung extends StatefulWidget {
  RadioButtonRiwayatJantung({Key key}) : super(key: key);

  @override
  _RadioButtonRiwayatJantungState createState() =>
      _RadioButtonRiwayatJantungState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _RadioButtonRiwayatJantungState extends State<RadioButtonRiwayatJantung> {
  RiwayatJantung _character = RiwayatJantung.iya;
  final RegisterController _registerController = Get.put(RegisterController());

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white54, borderRadius: BorderRadius.circular(30)),
      child: Card(elevation: 2,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 20),
              child: TextCustom(
                text: "Punya riwayat penyakit jantung ?",
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 40.0),
              child: ListTile(
                title: TextCustom(
                  text: 'Ada',
                  fontSize: 17,
                ),
                trailing: Radio(
                  value: RiwayatJantung.iya,
                  groupValue: _character,
                  onChanged: (RiwayatJantung value) {
                    setState(() {
                      _character = value;
                    });
                    _registerController.riwayatJK = value.toString();
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 40.0),
              child: ListTile(
                title: TextCustom(
                  text: 'Tidak ada',
                  fontSize: 17,
                ),
                trailing: Radio(
                  value: RiwayatJantung.tidak,
                  groupValue: _character,
                  onChanged: (RiwayatJantung value) {
                    setState(() {
                      _character = value;
                    });
                    _registerController.riwayatJK = value.toString();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
