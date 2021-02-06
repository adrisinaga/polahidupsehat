import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pola_hidup_sehat/controller/notifikasi_controller.dart';
import 'package:pola_hidup_sehat/widget/lottiefiles.dart';
import 'package:pola_hidup_sehat/widget/text.dart';

class NofitikasiScreen extends StatelessWidget {
  final NotifikasiController _notifikasiController =
      Get.put(NotifikasiController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: double.infinity,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Center(
                  //   child: TextCustom(
                  //     text: 'Halaman Notifikasi',
                  //     color: Colors.black87,
                  //     fontWeight: FontWeight.bold,
                  //     fontSize: 20,
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 36,
                  // ),

                  Obx(
                    () => ListView(
                      shrinkWrap: true,
                      children: _notifikasiController.notifikasiList.value
                          .map(
                            (e) => Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextCustom(
                                  text: e.judulNotifikasi,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),SizedBox(
                                    height: 30
                                ),
                                Row(
                                  children: [
                                    Expanded(child: LottieFilesPolaMakan()),
                                    Expanded(child: LottieFilesGym()),
                                  ],
                                ),
                                SizedBox(
                                  height: 30
                                ),
                                Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      border: Border.all(color: Colors.black54),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Html(
                                        data: """${e.isiNotifikasi}""",
                                        //Optional parameters:
                                        // backgroundColor: Colors.white70,
                                        style: {
                                          "div": Style(
                                              fontSize: FontSize.larger,
                                              fontStyle: FontStyle.normal,
                                              fontFamily: 'Exo'),
                                        },
                                        onImageTap: (src) {
                                          // Display the image in large form.
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  ),

                ],
              ),
            ),
            // Positioned(
            //   bottom: Get.height/2,
            //   right: Get.width/2,
            //   child: LottieFilesPolaMakan(),
            //   // child: Container(
            //   //   width: Get.width/4,
            //   //     height: Get.height/10,
            //   //     child: FittedBox(
            //   //         fit: BoxFit.fill, child: Image.asset('assets/bg.png'))),
            // ),
          ],
        ),
      ),
    );
  }
}
