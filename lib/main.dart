import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pola_hidup_sehat/screen/auth/konfirmasi_screen.dart';
import 'package:pola_hidup_sehat/screen/beranda/berandafitur_screen.dart';
import 'package:pola_hidup_sehat/screen/beranda/deskripsi_screen.dart';
import 'package:pola_hidup_sehat/screen/auth/isidatadiri_screen.dart';
import 'package:pola_hidup_sehat/screen/cek_jantung/heartrate_screen.dart';
import 'package:pola_hidup_sehat/screen/main_menu.dart';
import 'package:pola_hidup_sehat/screen/auth/login_screen.dart';
import 'package:pola_hidup_sehat/screen/auth/register_screen.dart';
import 'package:pola_hidup_sehat/screen/notification/secondnotification_screen.dart';
import 'package:pola_hidup_sehat/screen/notification/setnotification_screen.dart';
import 'package:pola_hidup_sehat/screen/pemeriksaan_lab/hasillab_screen.dart';
import 'package:pola_hidup_sehat/screen/pemeriksaan_lab/knowledgelab_screen.dart';
import 'package:pola_hidup_sehat/screen/pemeriksaan_lab/pemeriksaanlaboratium_pagescreen.dart';
import 'package:pola_hidup_sehat/screen/pemeriksaan_lab/penyimpananlab_screen.dart';
import 'package:pola_hidup_sehat/screen/splash_screen.dart';
import 'package:pola_hidup_sehat/widget/color.dart';

import 'screen/pemeriksaan_lab/pemeriksaanlab_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.black54,
    systemNavigationBarColor: Colors.grey,

  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primaryColor: AppColor.primary,
        accentColor: AppColor.accent,
        appBarTheme: AppBarTheme(
            color: AppColor.accent,
            centerTitle: false,
            brightness: Brightness.light,
            textTheme: TextTheme(
              headline6: TextStyle(fontSize: 16, color: AppColor.textButtonBlack),
            ),
            iconTheme: IconThemeData(
              color: Colors.black87,
            ),
            actionsIconTheme: IconThemeData(
              color: Colors.black87,
            ),
            elevation: 0
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/splashscreen',
      getPages: [
        GetPage(name: '/splashscreen', page: () => SplashScreen()),
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/register', page: () => RegisterScreen()),
        GetPage(name: '/mainMenu', page: () => MainMenu()),
        GetPage(name: '/berandafitur', page: () => BerandaFiturScreen()),
        GetPage(name: '/deskripsiJantung', page: () => DeskripsiScreen()),
        GetPage(name: '/isidatadiri', page: () => IsiDataDiriScreen()),
        GetPage(name: '/konfirmasiscreen', page: () => KonfirmasiScreen()),
        GetPage(name: '/hasilLab', page: () => HasilLabScreen()),
        GetPage(name: '/pemeriksaanLab', page: () => PemeriksaanLabScreen()),
        GetPage(name: '/penyimpananHasilLab', page: () => PenyimpananHasilLabScreen()),
        GetPage(name: '/setnotifscreen', page: () => SetNotificationScreen()),
        GetPage(name: '/secondnotifscreen', page: () => SecondNotificationScreen()),
        GetPage(name: '/heartrate', page: () => HeartRate()),
        GetPage(name: '/knowledgeLab', page: () => KnowledgeLab()),
      ],
    );
  }
}
