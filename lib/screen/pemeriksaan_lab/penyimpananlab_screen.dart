import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pola_hidup_sehat/controller/pemeriksaanLab_controller.dart';
import 'package:pola_hidup_sehat/widget/button.dart';
import 'package:pola_hidup_sehat/widget/color.dart';
import 'package:pola_hidup_sehat/widget/text.dart';
import 'package:pola_hidup_sehat/widget/textformfield.dart';

class PenyimpananHasilLabScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final PemeriksaanLabController _pemeriksaanLabController =
  Get.put(PemeriksaanLabController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextCustom(
          text: 'Penyimpanan Hasil Lab',
        ),
      ),
      body: Container(
        color: AppColor.primary,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///
                ///Hematologi Lengkap
                ///
                Center(
                  child: TextCustom(
                    text: 'Hematologi Lengkap',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                TextCustom(
                  text: 'Hemoglobin',
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                SizedBox(height: 10),
                TextFormFieldCustom(
                  hintText: 'Hemaglobin',
                  enabled: false,
                  textInputType: TextInputType.number,
                  textEditingController:
                  _pemeriksaanLabController.hemaglobinController,
                ),
                SizedBox(height: 16),
                TextCustom(
                  text: 'Hematokrit',
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                SizedBox(height: 10),
                TextFormFieldCustom(
                  hintText: 'Hematrokit',
                  enabled: false,
                  textInputType: TextInputType.number,
                  textEditingController:
                  _pemeriksaanLabController.hematrokitController,
                ),
                SizedBox(
                  height: 16,
                ),
                TextCustom(
                  text: 'Leukosit',
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                SizedBox(height: 10),
                TextFormFieldCustom(
                  hintText: 'Leukosit',
                  enabled: false,
                  textInputType: TextInputType.number,
                  textEditingController:
                  _pemeriksaanLabController.leukosit_hasil,
                ),
                SizedBox(
                  height: 16,
                ),
                TextCustom(
                  text: 'Trombosit',
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                SizedBox(height: 10),
                TextFormFieldCustom(
                  hintText: 'Trombosit',
                  enabled: false,
                  textInputType: TextInputType.number,
                  textEditingController:
                  _pemeriksaanLabController.trombosit_hasil,
                ),
                SizedBox(
                  height: 16,
                ),
                TextCustom(
                  text: 'MCV',
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                SizedBox(height: 10),
                TextFormFieldCustom(
                  hintText: 'MCV',
                  enabled: false,
                  textInputType: TextInputType.number,
                  textEditingController:
                  _pemeriksaanLabController.mcv_hasil,
                ),
                SizedBox(
                  height: 16,
                ),
                TextCustom(
                  text: 'MCH',
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                SizedBox(height: 10),
                TextFormFieldCustom(
                  hintText: 'MCH',
                  enabled: false,
                  textInputType: TextInputType.number,
                  textEditingController:
                  _pemeriksaanLabController.mch_hasil,
                ),
                SizedBox(
                  height: 16,
                ),
                TextCustom(
                  text: 'MCHC',
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                SizedBox(height: 10),
                TextFormFieldCustom(
                  hintText: 'MCHC',
                  enabled: false,
                  textInputType: TextInputType.number,
                  textEditingController:
                  _pemeriksaanLabController.mchc_hasil,
                ),
                SizedBox(
                  height: 16,
                ),
                TextCustom(
                  text: 'Basofil',
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                SizedBox(height: 10),
                TextFormFieldCustom(
                  hintText: 'Basofil',
                  enabled: false,
                  textInputType: TextInputType.number,
                  textEditingController:
                  _pemeriksaanLabController.basofil_hasil,
                ),
                SizedBox(
                  height: 16,
                ),
                TextCustom(
                  text: 'Eosinofil',
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                SizedBox(height: 10),
                TextFormFieldCustom(
                  hintText: 'Eosinofil',
                  enabled: false,
                  textInputType: TextInputType.number,
                  textEditingController:
                  _pemeriksaanLabController.eosinofil_hasil,
                ),
                SizedBox(
                  height: 16,
                ),
                TextCustom(
                  text: 'Stab',
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                SizedBox(height: 10),
                TextFormFieldCustom(
                  hintText: 'Stab',
                  enabled: false,
                  textInputType: TextInputType.number,
                  textEditingController:
                  _pemeriksaanLabController.stab_hasil,
                ),
                SizedBox(
                  height: 16,
                ),
                TextCustom(
                  text: 'Neutrofil',
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                SizedBox(height: 10),
                TextFormFieldCustom(
                  hintText: 'Neutrofil',
                  enabled: false,
                  textInputType: TextInputType.number,
                  textEditingController:
                  _pemeriksaanLabController.neutrofil_hasil,
                ),
                SizedBox(
                  height: 16,
                ),
                TextCustom(
                  text: 'Limfosit',
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                SizedBox(height: 10),
                TextFormFieldCustom(
                  hintText: 'Limfosit',
                  enabled: false,
                  textInputType: TextInputType.number,
                  textEditingController:
                  _pemeriksaanLabController.limfosit_hasil,
                ),
                SizedBox(
                  height: 16,
                ),
                TextCustom(
                  text: 'Monosit',
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                SizedBox(height: 10),
                TextFormFieldCustom(
                  hintText: 'Monosit',
                  enabled: false,
                  textInputType: TextInputType.number,
                  textEditingController:
                  _pemeriksaanLabController.monosit_hasil,
                ),
                SizedBox(
                  height: 16,
                ),
                TextCustom(
                  text: 'LED',
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                SizedBox(height: 10),
                TextFormFieldCustom(
                  hintText: 'LED',
                  enabled: false,
                  textInputType: TextInputType.number,
                  textEditingController:
                  _pemeriksaanLabController.led_hasil,
                ),
                SizedBox(
                  height: 16,
                ),
                TextCustom(
                  text: 'Eritrosit',
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                SizedBox(height: 10),
                TextFormFieldCustom(
                  hintText: 'Eritrosit',
                  enabled: false,
                  textInputType: TextInputType.number,
                  textEditingController:
                  _pemeriksaanLabController.eritrosit_hasil,
                ),
                SizedBox(
                  height: 16,
                ),

                ///
                ///Cholesterol LDL Direk
                ///
                Center(
                  child: TextCustom(
                    text: 'Cholesterol LDL Direk',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                TextCustom(
                  text: 'Kolesterol LDL',
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                SizedBox(height: 10),
                TextFormFieldCustom(
                  hintText: 'Kolesterol LDL',
                  enabled: false,
                  textInputType: TextInputType.number,
                  textEditingController:
                  _pemeriksaanLabController.kolesterolLDL_hasil,
                ),
                SizedBox(
                  height: 16,
                ),

                ///
                ///Cholesterol HDL Direk
                ///
                Center(
                  child: TextCustom(
                    text: 'Cholesterol HDL',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                TextCustom(
                  text: 'Kolesterol HDL',
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                SizedBox(height: 10),
                TextFormFieldCustom(
                  hintText: 'Kolesterol HDL',
                  enabled: false,
                  textInputType: TextInputType.number,
                  textEditingController:
                  _pemeriksaanLabController.kolesterolHDL_hasil,
                ),
                SizedBox(
                  height: 16,
                ),

                ///
                ///APTT
                ///
                Center(
                  child: TextCustom(
                    text: 'APTT',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                TextCustom(
                  text: 'APTT',
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                SizedBox(height: 10),
                TextFormFieldCustom(
                  hintText: 'APTT',
                  enabled: false,
                  textInputType: TextInputType.number,
                  textEditingController:
                  _pemeriksaanLabController.aptt_hasil,
                ),
                SizedBox(
                  height: 16,
                ),

                ///
                ///Glukosa Sewaktu
                ///
                Center(
                  child: TextCustom(
                    text: 'Glukosa Sewaktu',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                TextCustom(
                  text: 'Glukosa Sewaktu',
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                SizedBox(height: 10),
                TextFormFieldCustom(
                  hintText: 'Glukosa Sewaktu',
                  enabled: false,
                  textInputType: TextInputType.number,
                  textEditingController:
                  _pemeriksaanLabController.glukosaSewaktu_hasil,
                ),
                SizedBox(
                  height: 16,
                ),

                ///
                ///Kreatinin
                ///
                Center(
                  child: TextCustom(
                    text: 'Kreatinin',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                TextCustom(
                  text: 'Kreatinin',
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                SizedBox(height: 10),
                TextFormFieldCustom(
                  hintText: 'Kreatinin',
                  enabled: false,
                  textInputType: TextInputType.number,
                  textEditingController:
                  _pemeriksaanLabController.kreatinin_hasil,
                ),
                SizedBox(
                  height: 200,
                ),
                // MaterialButtonCustom(
                //   buttonText: 'Submit',
                //   color: Colors.redAccent,
                //   onTap: () {
                //     if (_formKey.currentState.validate()) {
                //       _pemeriksaanLabController.apiHasilLab();
                //     }
                //   },
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
