import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pola_hidup_sehat/controller/home_controller.dart';
import 'package:pola_hidup_sehat/controller/login_controller.dart';
import 'package:pola_hidup_sehat/model/screenargument_model.dart';
import 'package:pola_hidup_sehat/widget/lottiefiles.dart';
import 'package:pola_hidup_sehat/widget/text.dart';

class BerandaScreen extends StatelessWidget {
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Positioned(
            top: 10,
            right: 10,
            child: Obx(
              () => TextCustom(
                text: 'Hallo, ${_homeController.nameUser}',
                fontWeight: FontWeight.normal,
                fontSize: 12,
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Center(
                child: TextCustom(
                  text: 'Beranda',
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Expanded(
                child: Container(
                  height: Get.height / 2,
                  decoration: BoxDecoration(
                      // color: Colors.orangeAccent,
                      ),
                  child: Container(
                    width: double.infinity,
                    child: Center(
                      child: Obx(
                        () => Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 10,
                          runSpacing: 5,
                          children: _homeController.definisiList.value
                              .map(
                                (e) => (e.kategoriDefinisi != 'DefinisiJantung')
                                    ? Container()
                                    : ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty
                                              .resolveWith<Color>(
                                            (Set<MaterialState> states) {
                                              // if (states.contains(MaterialState.values))
                                              //   return Colors.lightBlue;
                                              return Colors
                                                  .orangeAccent; // Use the component's default.
                                            },
                                          ),
                                        ),
                                        onPressed: () {
                                          Get.toNamed('/deskripsiJantung',
                                              arguments: ScreenArguments(
                                                  e.judulAwalDefinisi,
                                                  e.judulDefinisi,
                                                  e.isiDefinisi));
                                        },
                                        child: FittedBox(
                                          fit: BoxFit.fill,
                                          child: TextCustom(
                                            text: e.judulAwalDefinisi,
                                            fontSize: 20,
                                            color: Colors.black87,
                                            fontWeight: FontWeight.normal,
                                            textOverflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                              )
                              .toList()
                              .cast<Widget>(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Divider(
                  thickness: 5,
                  color: Colors.black87,
                ),
              ),
              Expanded(
                child: Container(
                  height: Get.height / 2,
                  decoration: BoxDecoration(
                      // color: Colors.orangeAccent,
                      ),
                  child: Container(
                    width: double.infinity,
                    child: Center(
                      child: Obx(
                        () => Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 10,
                          runSpacing: 5,
                          children: _homeController.definisiList.value
                              .map(
                                (e) => (e.kategoriDefinisi != 'PolaMakan')
                                    ? Container()
                                    : ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty
                                              .resolveWith<Color>(
                                            (Set<MaterialState> states) {
                                              // if (states.contains(MaterialState.values))
                                              //   return Colors.lightBlue;
                                              return Colors
                                                  .yellowAccent; // Use the component's default.
                                            },
                                          ),
                                        ),
                                        onPressed: () {
                                          Get.toNamed('/deskripsiJantung',
                                              arguments: ScreenArguments(
                                                  e.judulAwalDefinisi,
                                                  e.judulDefinisi,
                                                  e.isiDefinisi));
                                        },
                                        child: FittedBox(
                                          fit: BoxFit.fill,
                                          child: TextCustom(
                                            text: e.judulAwalDefinisi,
                                            fontSize: 20,
                                            color: Colors.black87,
                                            fontWeight: FontWeight.normal,
                                            textOverflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                              )
                              .toList()
                              .cast<Widget>(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 40,
            right: 40,
            child: LottieFilesHeartBeart(),
            // child: Container(
            //     width: Get.width / 4,
            //     height: Get.height / 10,
            //     child: FittedBox(
            //         fit: BoxFit.fill, child: Image.asset('assets/bg.png'))),
          ),
        ],
      ),
    );
  }
}
