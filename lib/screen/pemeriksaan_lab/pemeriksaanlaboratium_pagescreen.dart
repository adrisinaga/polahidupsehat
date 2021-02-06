import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pola_hidup_sehat/controller/login_controller.dart';
import 'package:pola_hidup_sehat/controller/pemeriksaanLab_controller.dart';
import 'package:pola_hidup_sehat/widget/button.dart';
import 'package:pola_hidup_sehat/widget/color.dart';
import 'package:pola_hidup_sehat/widget/lottiefiles.dart';
import 'package:pola_hidup_sehat/widget/text.dart';

class PemeriksaanLaboratoriumScreen extends StatelessWidget {
  final PemeriksaanLabController _pemeriksaanLabController =
      Get.put(PemeriksaanLabController());
  final LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(
                // crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: TextCustom(
                      text: 'Pemeriksaan Laboratorium',
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 20),
                  LottieFilesLab(),
                  // Image.asset('assets/lab.jpg',colorBlendMode: BlendMode.colorBurn,color: AppColor.primary,),
                  // Container(
                  //   height: Get.height / 2.4,
                  //   width: Get.width / 7,
                  //   decoration: BoxDecoration(
                  //     image: DecorationImage(
                  //       image: AssetImage('assets/lab.jpg'),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 36,
                  ),
                  MaterialButtonCustom(
                    buttonText: 'Hasil Lab',
                    color: Colors.blueAccent,
                    onTap: () {
                      _pemeriksaanLabController.inputToController();
                      Get.toNamed('/hasilLab');
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  MaterialButtonCustom(
                    buttonText: 'Pemeriksaan Lab',
                    color: Colors.blueAccent[100],
                    onTap: () {
                      _pemeriksaanLabController.inputToController();
                      Get.toNamed('/pemeriksaanLab');
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  MaterialButtonCustom(
                    buttonText: 'Penyimpanan Hasil Lab',
                    color: Colors.purpleAccent,
                    onTap: () {
                      _pemeriksaanLabController.inputToController();
                      Get.toNamed('/penyimpananHasilLab');
                    },
                  ),
                  SizedBox(height: Get.height / 6),
                  TextCustom(
                    text:
                    'Note :',
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    alignment: TextAlign.center,
                  ),
                  TextCustom(
                    text:
                        'Nilai rujukan berdasarkan data dari RS Jantung Jakarta (Matraman)',
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    alignment: TextAlign.center,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
