import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pola_hidup_sehat/controller/home_controller.dart';
import 'package:pola_hidup_sehat/http/request.dart';
import 'package:pola_hidup_sehat/http/url.dart';
import 'package:pola_hidup_sehat/utility/shared_preferences.dart';
import 'package:pola_hidup_sehat/widget/color.dart';
import 'package:pola_hidup_sehat/widget/dialog.dart';
import 'package:pola_hidup_sehat/widget/text.dart';

class PemeriksaanLabController extends GetxController {
  TextEditingController hemaglobinController;
  TextEditingController hematrokitController;
  TextEditingController leukosit_hasil;
  TextEditingController trombosit_hasil;
  TextEditingController mcv_hasil;
  TextEditingController mch_hasil;
  TextEditingController mchc_hasil;
  TextEditingController basofil_hasil;
  TextEditingController eosinofil_hasil;
  TextEditingController stab_hasil;
  TextEditingController neutrofil_hasil;
  TextEditingController limfosit_hasil;
  TextEditingController monosit_hasil;
  TextEditingController led_hasil;
  TextEditingController eritrosit_hasil;
  TextEditingController kolesterolLDL_hasil;
  TextEditingController kolesterolHDL_hasil;
  TextEditingController aptt_hasil;
  TextEditingController glukosaSewaktu_hasil;
  TextEditingController kreatinin_hasil;
  TextEditingController periksaController;
  var hasil = 'null';
  var periksaControllerText = 0.0;

  Map<String, dynamic> body;
  final HomeController _homeController = Get.put(HomeController());

  @override
  void onInit() {
    hemaglobinController = TextEditingController();
    hematrokitController = TextEditingController();
    leukosit_hasil = TextEditingController();
    trombosit_hasil = TextEditingController();
    mcv_hasil = TextEditingController();
    mch_hasil = TextEditingController();
    mchc_hasil = TextEditingController();
    basofil_hasil = TextEditingController();
    eosinofil_hasil = TextEditingController();
    stab_hasil = TextEditingController();
    neutrofil_hasil = TextEditingController();
    limfosit_hasil = TextEditingController();
    monosit_hasil = TextEditingController();
    led_hasil = TextEditingController();
    eritrosit_hasil = TextEditingController();
    kolesterolLDL_hasil = TextEditingController();
    kolesterolHDL_hasil = TextEditingController();
    aptt_hasil = TextEditingController();
    glukosaSewaktu_hasil = TextEditingController();
    kreatinin_hasil = TextEditingController();
    periksaController = TextEditingController();
    super.onInit();
  }

  void inputToController() async {
    var account = await SharedPreferencesHelper.getAccount();
    Request request = Request(url: urlGetDataHasilLab, body: {
      'id_user': account.toString(),
    });

    request.post().then((value) {
      body = jsonDecode(value.body);
      if (body['status'] == 'Success') {
        print(body['data']);
        print('Behasil');
        body['data'].forEach((data) {
          hemaglobinController.text = data['hemoglobin_hasil'];
          hematrokitController.text = data['hematokrit_hasil'];
          leukosit_hasil.text = data['leukosit_hasil'];
          trombosit_hasil.text = data['trombosit_hasil'];
          mcv_hasil.text = data['mcv_hasil'];
          mch_hasil.text = data['mch_hasil'];
          mchc_hasil.text = data['mchc_hasil'];
          basofil_hasil.text = data['basofil_hasil'];
          eosinofil_hasil.text = data['eosinofil_hasil'];
          stab_hasil.text = data['stab_hasil'];
          neutrofil_hasil.text = data['neutrofil_hasil'];
          limfosit_hasil.text = data['limfosit_hasil'];
          monosit_hasil.text = data['monosit_hasil'];
          led_hasil.text = data['led_hasil'];
          eritrosit_hasil.text = data['eritrosit_hasil'];
          kolesterolLDL_hasil.text = data['kolesterolLDL_hasil'];
          kolesterolHDL_hasil.text = data['kolesterolHDL_hasil'];
          aptt_hasil.text = data['aptt_hasil'];
          glukosaSewaktu_hasil.text = data['glukosaSewaktu_hasil'];
          kreatinin_hasil.text = data['kreatinin_hasil'];
        });
      } else {
        print(body['error']);
      }
    });
  }

  void apiHasilLab() async {
    // Get.dialog(
    //   Center(child: CircularProgressIndicator()),
    //   barrierDismissible: false,
    // );

    print('Hemaglobin : ' +
        hemaglobinController.text +
        ', Hematokrit : ' +
        hematrokitController.text +
        ', Leukosit : ' +
        leukosit_hasil.text +
        ', Trombosit : ' +
        trombosit_hasil.text +
        ', MCV : ' +
        mcv_hasil.text +
        ', MCH : ' +
        mch_hasil.text +
        ', MCHC : ' +
        mchc_hasil.text +
        ', Basofil : ' +
        basofil_hasil.text +
        ', Eosinofil : ' +
        eosinofil_hasil.text +
        ', Stab : ' +
        stab_hasil.text +
        ', Neutrofil : ' +
        neutrofil_hasil.text +
        ', Limfosit : ' +
        limfosit_hasil.text +
        ', Monosit : ' +
        monosit_hasil.text +
        ', LED : ' +
        led_hasil.text +
        ', Eritrosit : ' +
        eritrosit_hasil.text +
        ', Kolesterol LDL : ' +
        kolesterolLDL_hasil.text +
        ', Kolesterol HDL : ' +
        kolesterolHDL_hasil.text +
        ', APTT : ' +
        aptt_hasil.text +
        ', Glukosa Sewaktu : ' +
        glukosaSewaktu_hasil.text +
        ', Kreatinin : ' +
        kreatinin_hasil.text);

    List<String> listData = List();
    var hemaglobin = double.tryParse(hemaglobinController.text);
    var hematokrit = double.tryParse(hematrokitController.text);
    var leukosit = double.tryParse(leukosit_hasil.text);
    var trombosit = double.tryParse(trombosit_hasil.text);
    var mcv = double.tryParse(mcv_hasil.text);
    var mch = double.tryParse(mch_hasil.text);
    var mchc = double.tryParse(mchc_hasil.text);
    var basofil = double.tryParse(basofil_hasil.text);
    var eosinofil = double.tryParse(eosinofil_hasil.text);
    var stab = double.tryParse(stab_hasil.text);
    var neutrofil = double.tryParse(neutrofil_hasil.text);
    var limfosit = double.tryParse(limfosit_hasil.text);
    var monosit = double.tryParse(monosit_hasil.text);
    var led = double.tryParse(led_hasil.text);
    var eritrosit = double.tryParse(eritrosit_hasil.text);
    var kolesterolLDL = double.tryParse(kolesterolLDL_hasil.text);
    var kolesterolHDL = double.tryParse(kolesterolHDL_hasil.text);
    var aptt = double.tryParse(aptt_hasil.text);
    var glukosaSewaktu = double.tryParse(glukosaSewaktu_hasil.text);
    var kreatinin = double.tryParse(kreatinin_hasil.text);

    if (hemaglobin < 13.0 || hemaglobin > 16.0) {
      listData.add('Hemaglobin');
    }
    if (hematokrit < 40.0 || hematokrit > 48.0) {
      listData.add('Hematokrit');
    }
    if (leukosit < 5000.0 || leukosit > 10000.0) {
      listData.add('Leukosit');
    }
    if (trombosit < 150000.0 || trombosit > 400000.0) {
      listData.add('Trombosit');
    }
    if (mcv < 80.0 || mcv > 95.0) {
      listData.add('MCV');
    }
    if (mch < 26.0 || mch > 34.0) {
      listData.add('MCH');
    }
    if (mchc < 32.0 || mchc > 36.0) {
      listData.add('MCHC');
    }
    if (basofil < 0.0 || basofil > 1.0) {
      listData.add('Basofil');
    }
    if (eosinofil < 0.0 || eosinofil > 3.0) {
      listData.add('Eosinofil');
    }
    if (stab < 2.0 || stab > 8.0) {
      listData.add('Stab');
    }
    if (neutrofil < 50.0 || neutrofil > 70.0) {
      listData.add('Neutrofil');
    }
    if (limfosit < 20.0 || limfosit > 40.0) {
      listData.add('Limfosit');
    }
    if (monosit < 2.0 || monosit > 8.0) {
      listData.add('Monosit');
    }
    if (led < 0.0 || led > 15.0) {
      listData.add('LED');
    }
    if (eritrosit < 4.2 || eritrosit > 5.5) {
      listData.add('Eritrosit');
    }
    if (kolesterolLDL < 0.0 || kolesterolLDL > 130.0) {
      listData.add('Kolesterol LDL');
    }
    if (kolesterolHDL < 30.0 || kolesterolHDL > 70.0) {
      listData.add('Kolesterol HDL');
    }
    if (aptt < 31.0 || aptt > 47.0) {
      listData.add('APTT');
    }
    if (glukosaSewaktu < 0.0 || glukosaSewaktu > 140.0) {
      listData.add('Glukosa Sewaktu');
    }
    if (kreatinin < 0.6 || kreatinin > 1.2) {
      listData.add('Kreatinin');
    }

    listData.forEach((element) => print(element));
    var counter = 1;

    Get.defaultDialog(
      title: "Selesai",
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: 'Jenis Pemeriksaan yang tidak normal : ',
              style: GoogleFonts.exo2(
                fontSize: 15,
                color: AppColor.textButtonBlack,
                fontWeight: FontWeight.normal,
              ),
              children: [],
            ),
          ),
          SizedBox(height: 18),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: listData
                .map((e) => TextCustom(
                      text: '${counter++}. ' + ' ' + e.toString() + " ",
                      fontSize: 15,
              fontWeight: FontWeight.bold,
                    ))
                .toList(),
          ),
          SizedBox(
            height: 50,
          ),
          TextCustom(
            text:
                'Note : \nNilai rujukan berdasarkan data dari RS Jantung Jakarta (Matraman)',
            fontSize: 10,
          ),
        ],
      ),
      actions: [
        FlatButton(
          child: TextCustom(
            text: 'Baik',
            color: AppColor.white,
          ),
          color: AppColor.accent,
          onPressed: () {
            Get.back();
            listData.clear();
          },
        ),
      ],
    );

    // if (int.tryParse(hemaglobinController.text) < 13.0 && int.tryParse(hemaglobinController.text) > 16.0) {
    //   print('Hemagloblin Tidak normal');
    // }

    var account = await SharedPreferencesHelper.getAccount();
    Request request = Request(url: urlAddHasilLab, body: {
      'id_user': account.toString(),
      'hemaglobin_hasil': hemaglobinController.text,
      'hematokrit_hasil': hematrokitController.text,
      'leukosit_hasil': leukosit_hasil.text,
      'trombosit_hasil': trombosit_hasil.text,
      'mcv_hasil': mcv_hasil.text,
      'mch_hasil': mch_hasil.text,
      'mchc_hasil': mchc_hasil.text,
      'basofil_hasil': basofil_hasil.text,
      'eosinofil_hasil': eosinofil_hasil.text,
      'stab_hasil': stab_hasil.text,
      'neutrofil_hasil': neutrofil_hasil.text,
      'limfosit_hasil': limfosit_hasil.text,
      'monosit_hasil': monosit_hasil.text,
      'led_hasil': led_hasil.text,
      'eritrosit_hasil': eritrosit_hasil.text,
      'kolesterolLDL_hasil': kolesterolLDL_hasil.text,
      'kolesterolHDL_hasil': kolesterolHDL_hasil.text,
      'aptt_hasil': aptt_hasil.text,
      'glukosaSewaktu_hasil': glukosaSewaktu_hasil.text,
      'kreatinin_hasil': kreatinin_hasil.text,
    });

    request.post().then((value) {
      body = jsonDecode(value.body);
      if (body['status'] == 'Success') {
        print(body['status']);
      } else {
        print(body['error']);
      }
    });
  }

  void pemeriksaanLab(String type) {
    periksaControllerText = double.tryParse(periksaController.text);
    if (periksaControllerText == null) {
      print('masukkan data');
    } else {
      switch (type) {
        case 'Hemoglobin':
          if (periksaControllerText >= 13.0 && periksaControllerText <= 16.0) {
            print('Normal');
            hasil = 'Normal';
          } else {
            print('Tidak Normal');
            hasil = 'Tidak Normal';
          }
          break;
        case 'Hematrokit':
          if (periksaControllerText >= 40.0 && periksaControllerText <= 48.0) {
            print('Normal');
            hasil = 'Normal';
          } else {
            print('Tidak Normal');
            hasil = 'Tidak Normal';
          }
          break;
        case 'Leukosit':
          if (periksaControllerText >= 5000.0 &&
              periksaControllerText <= 10000.0) {
            print('Normal');
            hasil = 'Normal';
          } else {
            print('Tidak Normal');
            hasil = 'Tidak Normal';
          }
          break;
        case 'Trombosit':
          if (periksaControllerText >= 150000.0 &&
              periksaControllerText <= 400000.0) {
            print('Normal');
            hasil = 'Normal';
          } else {
            print('Tidak Normal');
            hasil = 'Tidak Normal';
          }
          break;
        case 'MCV':
          if (periksaControllerText >= 80.0 && periksaControllerText <= 95.0) {
            print('Normal');
            hasil = 'Normal';
          } else {
            print('Tidak Normal');
            hasil = 'Tidak Normal';
          }
          break;
        case 'MCH':
          if (periksaControllerText >= 26.0 && periksaControllerText <= 34.0) {
            print('Normal');
            hasil = 'Normal';
          } else {
            print('Tidak Normal');
            hasil = 'Tidak Normal';
          }
          break;
        case 'MCHC':
          if (periksaControllerText >= 32.0 && periksaControllerText <= 36.0) {
            print('Normal');
            hasil = 'Normal';
          } else {
            print('Tidak Normal');
            hasil = 'Tidak Normal';
          }
          break;
        case 'Basofil':
          if (periksaControllerText >= 0.0 && periksaControllerText <= 1.0) {
            print('Normal');
            hasil = 'Normal';
          } else {
            print('Tidak Normal');
            hasil = 'Tidak Normal';
          }
          break;
        case 'Eosinofil':
          if (periksaControllerText >= 0.0 && periksaControllerText <= 3.0) {
            print('Normal');
            hasil = 'Normal';
          } else {
            print('Tidak Normal');
            hasil = 'Tidak Normal';
          }
          break;
        case 'Stab':
          if (periksaControllerText >= 2.0 && periksaControllerText <= 8.0) {
            print('Normal');
            hasil = 'Normal';
          } else {
            print('Tidak Normal');
            hasil = 'Tidak Normal';
          }
          break;
        case 'Neutrofil':
          if (periksaControllerText >= 50.0 && periksaControllerText <= 70.0) {
            print('Normal');
            hasil = 'Normal';
          } else {
            print('Tidak Normal');
            hasil = 'Tidak Normal';
          }
          break;
        case 'Limfosit':
          if (periksaControllerText >= 20.0 && periksaControllerText <= 40.0) {
            print('Normal');
            hasil = 'Normal';
          } else {
            print('Tidak Normal');
            hasil = 'Tidak Normal';
          }
          break;
        case 'Monosit':
          if (periksaControllerText >= 2.0 && periksaControllerText <= 8.0) {
            print('Normal');
            hasil = 'Normal';
          } else {
            print('Tidak Normal');
            hasil = 'Tidak Normal';
          }
          break;
        case 'LED':
          if (periksaControllerText >= 0.0 && periksaControllerText <= 15.0) {
            print('Normal');
            hasil = 'Normal';
          } else {
            print('Tidak Normal');
            hasil = 'Tidak Normal';
          }
          break;
        case 'Eritrosit':
          if (periksaControllerText >= 4.2 && periksaControllerText <= 5.5) {
            print('Normal');
            hasil = 'Normal';
          } else {
            print('Tidak Normal');
            hasil = 'Tidak Normal';
          }
          break;
        case 'Kolesterol LDL':
          if (periksaControllerText >= 0.0 && periksaControllerText <= 130.0) {
            print('Normal');
            hasil = 'Normal';
          } else {
            print('Tidak Normal');
            hasil = 'Tidak Normal';
          }
          break;
        case 'Kolesterol HDL':
          if (periksaControllerText >= 30.0 && periksaControllerText <= 70.0) {
            print('Normal');
            hasil = 'Normal';
          } else {
            print('Tidak Normal');
            hasil = 'Tidak Normal';
          }
          break;
        case 'APTT':
          if (periksaControllerText >= 31.0 && periksaControllerText <= 47.0) {
            print('Normal');
            hasil = 'Normal';
          } else {
            print('Tidak Normal');
            hasil = 'Tidak Normal';
          }
          break;
        case 'Glukosa Sewaktu':
          if (periksaControllerText >= 0.0 && periksaControllerText <= 140.0) {
            print('Normal');
            hasil = 'Normal';
          } else {
            print('Tidak Normal');
            hasil = 'Tidak Normal';
          }
          break;
        case 'Kreatinin':
          if (periksaControllerText >= 0.6 && periksaControllerText <= 1.2) {
            print('Normal');
            hasil = 'Normal';
          } else {
            print('Tidak Normal');
            hasil = 'Tidak Normal';
          }
          break;
        default:
          print('No Data $type');
          break;
      }

      Get.defaultDialog(
        title: 'Hasil Pemeriksaan',
        content: TextCustom(
          alignment: TextAlign.center,
          text:
              '$type anda $hasil,\n${(hasil == 'Normal') ? 'tetap jaga kesehatan' : 'segera periksa dokter'}',
          fontSize: 20,
        ),
        actions: [
          FlatButton(
            child: Text('Baik'),
            color: AppColor.alertBorder,
            onPressed: () {
              Get.back();
            },
          ),
        ],
      );
      periksaControllerText = 0.0;
      periksaController.text = '';
      hasil = '';
    }
  }

  @override
  void dispose() {
    hemaglobinController.dispose();
    hematrokitController.dispose();
    leukosit_hasil.dispose();
    trombosit_hasil.dispose();
    mcv_hasil.dispose();
    mch_hasil.dispose();
    mchc_hasil.dispose();
    basofil_hasil.dispose();
    eosinofil_hasil.dispose();
    stab_hasil.dispose();
    neutrofil_hasil.dispose();
    limfosit_hasil.dispose();
    monosit_hasil.dispose();
    led_hasil.dispose();
    eritrosit_hasil.dispose();
    kolesterolLDL_hasil.dispose();
    kolesterolHDL_hasil.dispose();
    aptt_hasil.dispose();
    glukosaSewaktu_hasil.dispose();
    kreatinin_hasil.dispose();
    periksaController.dispose();
    super.dispose();
  }
}
