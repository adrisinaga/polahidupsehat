import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pola_hidup_sehat/controller/pemeriksaanLab_controller.dart';
import 'package:pola_hidup_sehat/widget/button.dart';
import 'package:pola_hidup_sehat/widget/color.dart';
import 'package:pola_hidup_sehat/widget/text.dart';
import 'package:pola_hidup_sehat/widget/textformfield.dart';

class SatuanPemeriksaanLabScreen extends StatelessWidget {
  final PemeriksaanLabController _pemeriksaanLabController =
  Get.put(PemeriksaanLabController());
  final String type;
  final Color color;

  SatuanPemeriksaanLabScreen({this.type, this.color});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColor.primary,
      appBar: AppBar(centerTitle: true,
        title: TextCustom(text: 'Periksa $type Anda',fontSize: 15,fontWeight: FontWeight.normal,),
        backgroundColor: color,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40,),
              TextFormFieldCustom(
                hintText: type,
                textInputType: TextInputType.number,
                textEditingController:
                _pemeriksaanLabController.periksaController,
              ),
              SizedBox(height: 20,),
              Align(
                alignment: Alignment.bottomCenter,
                child: MaterialButtonCustom(
                  buttonText: 'Periksa',
                  color: color,
                  onTap: () {
                    _pemeriksaanLabController.pemeriksaanLab(type);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
