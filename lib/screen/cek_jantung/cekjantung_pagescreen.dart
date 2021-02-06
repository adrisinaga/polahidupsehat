import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pola_hidup_sehat/screen/cek_jantung/heartrate_screen.dart';
import 'package:pola_hidup_sehat/widget/color.dart';
import 'package:pola_hidup_sehat/widget/lottiefiles.dart';
import 'package:pola_hidup_sehat/widget/text.dart';

class CekJantungScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = Get.height;
    double width = Get.width;
    return SafeArea(
      child: Container(
        child: Stack(
          children: [
            Container(
              color: AppColor.primary,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(
                children: [
                  Center(
                    child: TextCustom(
                      text: 'Pemeriksaan Jantung',
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextCustom(
                    text: 'Petunjuk Pemakaian : ',
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextCustom(
                    text: '1. Klik tombol hijau\n'
                        '2. Tempelkan tangan telunjuk ke flash dan kamera\n'
                        '3. Tahan selama 20 detik\n'
                        '4. Perhatikan hasil bpm\n'
                        '5. Angka 50-100 bpm menunjukkan jantung Anda masih berdenyut secara normal, '
                        'jika kurang/lebih dari itu maka segera periksa ke dokter spesilis jantung',
                    color: Colors.black87,
                    fontWeight: FontWeight.normal,
                    fontSize: 13,
                  ),
                  SizedBox(
                    height: height / 9,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/heartrate');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        color: Colors.redAccent,
                      ),
                      width: double.infinity,
                      height: 400,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: TextCustom(
                                text: 'Periksa Denyut Jantung',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            LottieFilesRateBeat()
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
