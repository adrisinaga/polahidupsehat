import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pola_hidup_sehat/controller/home_controller.dart';
import 'package:pola_hidup_sehat/screen/cek_jantung/cekjantung_pagescreen.dart';
import 'package:pola_hidup_sehat/screen/beranda/beranda_pagescreen.dart';
import 'package:pola_hidup_sehat/screen/hitung_kalori/hitungkalori_pagescreen.dart';
import 'package:pola_hidup_sehat/screen/notification/notifikasi_screen.dart';
import 'package:pola_hidup_sehat/screen/pemeriksaan_lab/pemeriksaanlaboratium_pagescreen.dart';
import 'package:pola_hidup_sehat/widget/color.dart';
import 'package:pola_hidup_sehat/widget/text.dart';
import 'dart:math' as math; // import this

class MainMenu extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  Future<bool> _onBackPressed(BuildContext context) {
    return Get.defaultDialog(
        title: "Konfirmasi",
        middleText: "Ingin logout dari aplikasi ?",
        actions: [
          FlatButton(
            color: Colors.red[400],
            child: Text(
              'Iya, logout',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              // Navigator.of(context).pop(true); //Will exit the App
              homeController.apiLogout();
            },
          ),
          FlatButton(
            child: Text('Tidak'),
            onPressed: () {
              Navigator.of(context).pop(false); //Will not exit the App
            },
          ),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: WillPopScope(
        onWillPop: () => _onBackPressed(context),
        child: Container(
          // padding: EdgeInsets.all(16),
          child: PageView(
            controller: homeController.pageController(),
            physics: BouncingScrollPhysics(),
            pageSnapping: true,
            children: <Widget>[
              PageViewContainer(
                nextPage: 'Cek Jantung',
                color: Colors.blue,
                pageController: homeController.pageController(),
                animateToNext: 1,
              ),
              PageViewContainer(
                prevPage: 'Beranda',
                nextPage: 'Hitung Kalori',
                color: Colors.greenAccent,
                pageController: homeController.pageController(),
                animateToPrev: 0,
                animateToNext: 2,
              ),
              PageViewContainer(
                prevPage: 'Cek Jantung',
                nextPage: 'Pemeriksaaan \nLaboratorium',
                color: Colors.deepOrange,
                pageController: homeController.pageController(),
                animateToPrev: 1,
                animateToNext: 3,
              ),
              PageViewContainer(
                prevPage: 'Hitung Kalori',
                nextPage: 'Notifikasi',
                color: Colors.orangeAccent,
                pageController: homeController.pageController(),
                animateToPrev: 2,
                animateToNext: 4,
              ),
              PageViewContainer(
                prevPage: 'Pemeriksaan \nLaboratorium',
                color: Colors.orangeAccent,
                pageController: homeController.pageController(),
                animateToPrev: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PageViewContainer extends StatelessWidget {
  final String prevPage;
  final String nextPage;
  final Color color;
  final PageController pageController;
  final int animateToPrev;
  final int animateToNext;

  PageViewContainer(
      {this.prevPage,
      this.nextPage,
      this.color,
      this.pageController,
      this.animateToPrev,
      this.animateToNext});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffFFFFF5),
      child: Stack(
        children: [
          (animateToPrev == null)
              ? BerandaScreen()
              : (animateToPrev == 0)
                  ? CekJantungScreen()
                  : (animateToPrev == 1)
                      ? HitungKaloriScreen()
                      : (animateToPrev == 2)
                          ? PemeriksaanLaboratoriumScreen()
                          : (animateToPrev == 3)
                              ? NofitikasiScreen()
                              : Container(),
          (animateToPrev != null)
              ? Positioned(
                  bottom: 0,
                  left: 20,
                  child: RaisedButton(
                    onPressed: () {
                      if (pageController.hasClients) {
                        print('prev');
                        pageController.animateToPage(
                          animateToPrev,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    color: AppColor.accent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(
                          Icons.arrow_back,
                          size: 25,color: AppColor.white,
                        ),
                        TextCustom(text: prevPage,color: AppColor.white,),
                      ],
                    ),
                  ),
                  // child: Column(
                  //   children: [
                  //     GestureDetector(
                  //       onTap: () {
                  //         if (pageController.hasClients) {
                  //           print('test');
                  //           pageController.animateToPage(
                  //             animateToPrev,
                  //             duration: const Duration(milliseconds: 400),
                  //             curve: Curves.easeInOut,
                  //           );
                  //         }
                  //       },
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           TextCustom(
                  //             text: "Kembali ke halaman",
                  //             color: Colors.black45,
                  //             fontSize: 10,
                  //           ),
                  //           Row(
                  //             children: [
                  //               Transform(
                  //                 alignment: Alignment.center,
                  //                 transform: Matrix4.rotationY(math.pi),
                  //                 child: Icon(Icons.arrow_right_alt_sharp,
                  //                     size: 12),
                  //               ),
                  //               TextCustom(text: prevPage),
                  //             ],
                  //           ),
                  //         ],
                  //       ),
                  //     )
                  //   ],
                  // ),
                )
              : Container(),
          (animateToNext != null)
              ? Positioned(
                  bottom: 0,
                  right: 20,
            child: RaisedButton(
              onPressed: () {
                if (pageController.hasClients) {
                  print('next');
                  pageController.animateToPage(
                    animateToNext,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                  );
                }
              },
              color: AppColor.accent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextCustom(text: nextPage,color: AppColor.white,),
                  Icon(
                    Icons.arrow_forward,
                    size: 25,color: AppColor.white,
                  )
                ],
              ),
            ),
                )
              : Container(),
        ],
      ),
    );
  }
}
