import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pola_hidup_sehat/utility/shared_preferences.dart';
import 'package:pola_hidup_sehat/widget/color.dart';
import 'package:pola_hidup_sehat/widget/lottiefiles.dart';
import 'package:pola_hidup_sehat/widget/text.dart';

class HitungBmiController extends GetxController {
  TextEditingController beratBadanController;
  TextEditingController tinggiBadanController;
  TextEditingController umurController;
  var _dropdownValue = 'Rendah'.obs;

  get dropdownValue => _dropdownValue.value;

  set dropdownValue(String val) {
    _dropdownValue.value = val;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    beratBadanController = TextEditingController();
    tinggiBadanController = TextEditingController();
    umurController = TextEditingController();
    super.onInit();
  }

  void calculateBMI() async {
    double beratBadan;
    double tinggiBadan;
    double umur;
    double resultLakilaki;
    double resultPerempuan;
    String kategori;
    double aktivitas;
    double selisih;

    //Jenis Kelamin Pengguna
    var gender = await SharedPreferencesHelper.getGender();

    //Aktivitas pengguna
    switch (dropdownValue) {
      case 'Rendah':
        aktivitas = 1.2;
        break;
      case 'Sedang':
        aktivitas = 1.3;
        break;
      case 'Tinggi':
        aktivitas = 1.4;
        break;
      default:
        print('Tidak ada opsi');
        aktivitas = 1.2;
        break;
    }

    //Berat badan pengguna
    beratBadan = double.tryParse(beratBadanController.text);
    //Tinggi badan pengguna
    tinggiBadan = double.tryParse(tinggiBadanController.text);
    //Umur pengguna
    umur = double.tryParse(umurController.text);

    print('Berat Badan : ' + beratBadan.toString());
    print('Tinggi Badan : ' + tinggiBadan.toString());
    print('Umur : ' + umur.toString());
    print('Jenis Kelamin : ' + gender.toString());
    print('Aktivitas : ' + aktivitas.toString());

    if (gender == 'Laki-laki') {
      resultLakilaki =
          ((88.4 + 13.4 * beratBadan) + (4.8 * tinggiBadan) - (5.68 * umur)) *
              aktivitas;
      selisih = 2500 - resultLakilaki;
      kategori = (selisih.abs() < 1300) ? 'Normal' : 'Jaga Pola Makan';
    } else {
      resultPerempuan =
          ((447.6 + 9.25 * beratBadan) + (3.10 * tinggiBadan) - (4.33 * umur)) *
              aktivitas;
      selisih = 2500 - resultPerempuan;
      kategori = (selisih.abs() < 1300) ? 'Normal' : 'Jaga Pola Makan';
    }
    print('Result Laki-laki : ' + resultLakilaki.toString());
    print('Result Perempuan : ' + resultPerempuan.toString());
    print('Kategori : ' + kategori.toString());

    // onClose();
    Get.defaultDialog(
      title: "Kebutuhan Kalori",
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: LottieFilesBeverages()),
          RichText(
            text: TextSpan(
              text:
                  'Untuk menjaga tubuh Anda agar tetap bekerja dengan baik, jumlah kebutuhan kalori per hari Anda adalah',
              style: GoogleFonts.exo2(
                fontSize: 15,
                color: AppColor.textButtonBlack,
                fontWeight: FontWeight.normal,
              ),
              children: <TextSpan>[
                TextSpan(
                  text:
                      ' ${(gender == 'Laki-laki') ? resultLakilaki : resultPerempuan} kkal.',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          (kategori=='Normal')?TextCustom(
            text: 'Kebutuhan kalori sudah noraml. Tetap jaga pola makan teratur dengan baik',
          ):TextCustom(
            text: 'Kebutuhan kalori belum dapat dibilang normal. Konsultasikan kepada dokter untuk mendapat tips pola makan sehat',
    ),
          SizedBox(height: 10),
          TextCustom(
            text:
                "Rata-rata pria dewasa membutuhkan sekitar 2.500 kalori sehari, sementara wanita dewasa biasanya butuh sekitar 2.000 kalori. \n\nNamun, ingat bahwa sebenarnya kebutuhan kalori per hari tiap orang tetap berbeda-beda. ",
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
          },
        ),
      ],
    );
  }

  void onClear() {
    beratBadanController.clear();
    tinggiBadanController.clear();
    umurController.clear();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    beratBadanController.clear();
    tinggiBadanController.clear();
    umurController.clear();
    super.onClose();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    beratBadanController?.dispose();
    tinggiBadanController?.dispose();
    umurController?.dispose();
    super.dispose();
  }
}
