import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pola_hidup_sehat/controller/register_controller.dart';
import 'package:pola_hidup_sehat/widget/lottiefiles.dart';
import 'package:pola_hidup_sehat/widget/text.dart';
import 'package:http/http.dart' as http;

class KonfirmasiScreen extends StatefulWidget {
  @override
  _KonfirmasiScreenState createState() => _KonfirmasiScreenState();
}

class _KonfirmasiScreenState extends State<KonfirmasiScreen> {
  final RegisterController _registerController = Get.put(RegisterController());

  Future<bool> _onBackPressed(BuildContext context) {
    return Get.defaultDialog(
      title: '',
      middleText: "Pilih salah satu opsi",
      actions: [
        FlatButton(
          color: Colors.red[400],
          child: Text(
            'Baik',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            Navigator.of(context).pop(false); //Will exit the App
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: WillPopScope(
        onWillPop: () => _onBackPressed(context),
        child: Container(
          width: Get.width,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: Get.height / 2.4,
                  width: Get.width / 3,
                  // decoration: BoxDecoration(
                  //   image: DecorationImage(
                  //     image: AssetImage('assets/logo_heart.png'),
                  //   ),
                  // ),
                  child: LottieFilesHeartBeart(),
                ),
                Center(
                  child: TextCustom(
                    text: 'Apakah Anda ingin terapkan pola hidup sehat ?',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    alignment: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: Get.height / 26,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            // if (states.contains(MaterialState.values))
                            //   return Colors.lightBlue;
                            return Colors
                                .orange; // Use the component's default.
                          },
                        ),
                      ),
                      onPressed: () {
                        _registerController.apiRegister('/mainMenu');
                      },
                      child: TextCustom(
                        text: 'Terapkan',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 40),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            // if (states.contains(MaterialState.values))
                            //   return Colors.lightBlue;
                            return Colors
                                .grey[200]; // Use the component's default.
                          },
                        ),
                      ),
                      onPressed: () {
                        _registerController.apiRegister('/berandafitur');
                      },
                      child: TextCustom(
                        text: 'Nanti saja',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
