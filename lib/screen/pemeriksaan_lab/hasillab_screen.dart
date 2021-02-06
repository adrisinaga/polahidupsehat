import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pola_hidup_sehat/controller/login_controller.dart';
import 'package:pola_hidup_sehat/controller/pemeriksaanLab_controller.dart';
import 'package:pola_hidup_sehat/widget/button.dart';
import 'package:pola_hidup_sehat/widget/color.dart';
import 'package:pola_hidup_sehat/widget/text.dart';
import 'package:pola_hidup_sehat/widget/textformfield.dart';

class HasilLabScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final PemeriksaanLabController _pemeriksaanLabController =
      Get.put(PemeriksaanLabController());
  final LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextCustom(
          text: 'Hasil Lab',
        ),
        actions: [
          IconButton(icon: Icon(Icons.info_outline_rounded), onPressed: (){
            Get.toNamed('/knowledgeLab');
          }),
        ],
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
                  textInputType: TextInputType.number,
                  textEditingController:
                  _pemeriksaanLabController.kreatinin_hasil,
                ),
                SizedBox(
                  height: 16,
                ),





                MaterialButtonCustom(
                  buttonText: 'Submit',
                  color: Colors.redAccent,
                  onTap: () {
                    if (_formKey.currentState.validate()) {
                      _pemeriksaanLabController.apiHasilLab();
                    }
                  },
                ),
                SizedBox(height: 200,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
