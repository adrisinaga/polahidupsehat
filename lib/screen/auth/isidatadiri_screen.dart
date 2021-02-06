import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pola_hidup_sehat/controller/login_controller.dart';
import 'package:pola_hidup_sehat/controller/register_controller.dart';
import 'package:pola_hidup_sehat/widget/color.dart';
import 'package:pola_hidup_sehat/widget/dropdown.dart';
import 'package:pola_hidup_sehat/widget/radiobutton.dart';
import 'package:pola_hidup_sehat/widget/text.dart';
import 'package:pola_hidup_sehat/widget/textformfield.dart';

class IsiDataDiriScreen extends StatefulWidget {
  @override
  _IsiDataDiriScreenState createState() => _IsiDataDiriScreenState();
}

class _IsiDataDiriScreenState extends State<IsiDataDiriScreen> {
  final _formKey = GlobalKey<FormState>();

  final RegisterController _registerController = Get.put(RegisterController());

  DateTime selectedDate = DateTime.now();

  _selectDate(BuildContext context) async {
    print(selectedDate.year.toString() +
        '-' +
        selectedDate.month.toString() +
        '-' +
        selectedDate.day.toString());
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        // Refer step 1
        firstDate: DateTime(1950),
        lastDate: DateTime(2022),
        builder: (context, child) {
          return Theme(
            data: ThemeData.dark(), // This will change to light theme.
            child: child,
          );
        });
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        _registerController.tanggalLahirController.text =
            "${selectedDate.year.toString()}-${selectedDate.month.toString()}-${selectedDate.day.toString()}";
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(title: Text('Isi Data Diri')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: AppColor.primary,
            padding: EdgeInsets.all(16),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 5.0, bottom: 15, left: 10, right: 10),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextCustom(
                            text: "Isi data diri kamu",
                            fontSize: 25,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      SizedBox(height: 30),

                      ///Nama Lengkap
                      TextCustom(
                        text: 'Nama Lengkap',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _registerController.namaTextController,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          hintText: "Nama lengkap",
                          hintStyle: TextStyle(fontSize: 15),
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        ),
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.emailAddress,
                        inputFormatters: [
                          BlacklistingTextInputFormatter.singleLineFormatter,
                        ],
                        validator: (value) =>
                            value.trim().isEmpty ? 'Nama Required' : null,
                      ),
                      SizedBox(height: 16),

                      ///Alamat
                      TextCustom(
                        text: 'Alamat',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _registerController.alamatController,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          hintText: "Alamat",
                          hintStyle: TextStyle(fontSize: 15),
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        ),
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.emailAddress,
                        inputFormatters: [
                          BlacklistingTextInputFormatter.singleLineFormatter,
                        ],
                        validator: (value) =>
                            value.trim().isEmpty ? 'Alamat Required' : null,
                      ),
                      SizedBox(height: 16),

                      ///Tanggal Lahir
                      TextCustom(
                        text: 'Tanggal Lahir',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              width: Get.width,
                              child: TextFormField(
                                controller:
                                    _registerController.tanggalLahirController,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                  ),
                                  hintText: "Tanggal Lahir",
                                  hintStyle: TextStyle(fontSize: 15),
                                  contentPadding: EdgeInsets.fromLTRB(
                                      20.0, 15.0, 20.0, 15.0),
                                ),
                                cursorColor: Colors.black,
                                enabled: false,
                                inputFormatters: [
                                  BlacklistingTextInputFormatter
                                      .singleLineFormatter,
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          RaisedButton(
                            onPressed: () => _selectDate(context),
                            // Refer step 3
                            child: TextCustom(
                              text: 'Pilih Tanggal',
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
                            color: Colors.orange,
                          ),
                        ],
                      ),
                      SizedBox(height: 16),

                      ///Tinggi Badan
                      TextCustom(
                        text: 'Tinggi Badan',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _registerController.tinggiBadanController,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          hintText: "Tinggi Badan",
                          hintStyle: TextStyle(fontSize: 15),
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        ),
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          BlacklistingTextInputFormatter.singleLineFormatter,
                        ],
                        validator: (value) => value.trim().isEmpty
                            ? 'Tinggi Badan Required'
                            : null,
                      ),
                      SizedBox(height: 16),

                      ///Berat Badan
                      TextCustom(
                        text: 'Berat Badan',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _registerController.beratBadanController,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          hintText: "Berat Badan",
                          hintStyle: TextStyle(fontSize: 15),
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        ),
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          BlacklistingTextInputFormatter.singleLineFormatter,
                        ],
                        validator: (value) => value.trim().isEmpty
                            ? 'Berat Badan Required'
                            : null,
                      ),
                      SizedBox(height: 16),

                      ///Pilih Golongan Darah
                      DropdownGolDarah(),
                      SizedBox(height: 16),

                      ///Pilih Gender
                      RadioButtonGender(),
                      SizedBox(height: 16),

                      ///Punya riwayat penyakit jantung
                      RadioButtonRiwayatJantung(),
                      SizedBox(height: 16),
                      SizedBox(height: 46),
                      Center(
                        child: MaterialButton(
                          color: Colors.deepOrangeAccent,
                          splashColor: Colors.white,
                          height: 45,
                          minWidth: Get.width / 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            'Submit Data',
                            style: GoogleFonts.exo2(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              // _registerController.apiRegister();
                              Get.toNamed('/konfirmasiscreen');
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
//
// class TextFormFieldCustom extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: _registerController.tinggiBadanController,
//       keyboardType: TextInputType.text,
//       decoration: InputDecoration(
//         filled: true,
//         fillColor: Colors.grey[200],
//         hintText: 'Tinggi Badan',
//         hintStyle: GoogleFonts.exo2(
//           fontSize: 16,
//           color: Colors.grey,
//           fontWeight: FontWeight.normal,
//         ),
//         border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//             borderSide: BorderSide(
//               color: Colors.transparent,
//               width: 0,
//             )),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: BorderSide(
//             color: Colors.transparent,
//             width: 0,
//           ),
//         ),
//       ),
//       validator: (value) =>
//       value.trim().isEmpty ? 'Tinggi Badan required' : null,
//       style: GoogleFonts.exo2(
//         fontSize: 16,
//         color: Colors.black87,
//         fontWeight: FontWeight.normal,
//       ),
//     );
//   }
// }
//
