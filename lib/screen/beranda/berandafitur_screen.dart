import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pola_hidup_sehat/controller/home_controller.dart';
import 'package:pola_hidup_sehat/widget/color.dart';
import 'package:pola_hidup_sehat/widget/text.dart';
import 'dart:math' as math; // import this

class BerandaFiturScreen extends StatelessWidget {
  final HomeController _homeController = Get.put(HomeController());

  Future<bool> _onBackPressed(BuildContext context) {
    return Get.defaultDialog(
        title: "Konfirmasi",
        middleText: "Ingin logout dari aplikasi ?",
        actions: [
          FlatButton(
            color: Colors.red[400],
            child: Text(
              'Logout',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              _homeController.apiLogout();
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
      backgroundColor: AppColor.primary,
      body: WillPopScope(
        onWillPop: () => _onBackPressed(context),
        child: SafeArea(
          child: Stack(
            children: [
              // Positioned(
              //   right: 20,
              //   bottom: 20,
              //   child: Logo(),
              // ),
              Center(
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        width: Get.width,
                        height: Get.height / 1.3,
                        decoration: BoxDecoration(
                          // border: Border.all(color: Colors.deepOrangeAccent),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),

                        // padding: EdgeInsets.all(16),
                        child: PageView(
                          controller: _homeController.pageController(),
                          physics: BouncingScrollPhysics(),
                          pageSnapping: true,
                          children: <Widget>[
                            PageViewContainer(
                              nextPage: 'Cek Jantung',
                              color: Colors.blue,
                              pageController: _homeController.pageController(),
                              animateToNext: 1,
                            ),
                            PageViewContainer(
                              prevPage: 'Beranda',
                              nextPage: 'Hitung Kalori',
                              color: Colors.greenAccent,
                              pageController: _homeController.pageController(),
                              animateToPrev: 0,
                              animateToNext: 2,
                            ),
                            PageViewContainer(
                              prevPage: 'Cek Jantung',
                              nextPage: 'Pemeriksaaan \nLaboratorium',
                              color: Colors.deepOrange,
                              pageController: _homeController.pageController(),
                              animateToPrev: 1,
                              animateToNext: 3,
                            ),
                            PageViewContainer(
                              prevPage: 'Hitung Kalori',
                              nextPage: 'Notifikasi',
                              color: Colors.orangeAccent,
                              pageController: _homeController.pageController(),
                              animateToPrev: 2,
                              animateToNext: 4,
                            ),
                            PageViewContainer(
                              prevPage: 'Pemeriksaan \nLaboratorium',
                              color: Colors.orangeAccent,
                              pageController: _homeController.pageController(),
                              animateToPrev: 3,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextCustom(
                            text:
                                'Terapkan Pola Hidup Sehat untuk mendapatkan full akses fiturnya ?',
                            fontSize: 15,
                            alignment: TextAlign.center,
                            maxLines: 2,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          FlatButton(
                              color: AppColor.accent,
                              onPressed: () {
                                _homeController.terapkanPolaHidupSehat();
                              },
                              child: TextCustom(text: 'Iya, terapkan')),
                        ],
                      ),
                    ),
                  ],
                ),
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
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              'assets/background.png',
              height: Get.height / 4,
            ),
          ),
          (animateToPrev == null)
              ? Beranda()
              : (animateToPrev == 0)
                  ? CekJantung()
                  : (animateToPrev == 1)
                      ? HitungKalori()
                      : (animateToPrev == 2)
                          ? PemeriksaanLaboratorium()
                          : (animateToPrev == 3)
                              ? Nofitikasi()
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
                          size: 25,
                          color: AppColor.white,
                        ),
                        TextCustom(
                          text: prevPage,
                          color: AppColor.white,
                        ),
                      ],
                    ),
                  ),
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
                        TextCustom(
                          text: nextPage,
                          color: AppColor.white,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          size: 25,
                          color: AppColor.white,
                        )
                      ],
                    ),
                  ),
                  // child: Column(
                  //   children: [
                  //     TextCustom(
                  //       text: "Fitur",
                  //       color: Colors.black45,
                  //       fontSize: 10,
                  //     ),
                  //     Row(
                  //       children: [
                  //         TextCustom(text: nextPage),
                  //         Icon(Icons.arrow_right_alt_sharp, size: 12),
                  //       ],
                  //     ),
                  //   ],
                  // ),
                  //   ),
                )
              : Container(),
        ],
      ),
    );
  }
}

class Beranda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextCustom(
                text: 'Beranda',
                fontSize: 35,
              ),
              SizedBox(height: 30),
              TextCustom(
                fontSize: 20,
                text:
                    'Fitur ini membantu Anda mengetahui makanan apa saja yang baik untuk dikonsumsi. '
                    'Disini juga terdapat pengetahuan mengenai pola olaharaga teratur dan juga pola istrihat',
              ),
              SizedBox(height: 10),
              Container(
                height: 300,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/beranda.png',
                      ),
                    )),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class CekJantung extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextCustom(
                text: 'Cek Jantung',
                fontSize: 35,
              ),
              SizedBox(height: 30),
              TextCustom(
                fontSize: 20,
                text:
                    'Fitur ini membantu Anda mengukur detak jantung melalui flash+camera.',
              ),
              SizedBox(height: 10),
              Container(
                height: 300,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/cekjantung.png',
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HitungKalori extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextCustom(
                text: 'Hitung Kalori',
                fontSize: 35,
              ),
              SizedBox(height: 30),
              TextCustom(
                fontSize: 20,
                text:
                    'Fitur ini dapat membantu Anda menghitung kebutuhan kalori setiap harinya. '
                    'Data diambil berdasarkan berat badan, tinggi badan, umur dan faktor tingkat aktivitas ',
              ),
              SizedBox(height: 10),
              Container(
                height: 300,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/hitungkalori.png',
                      ),
                    )),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class PemeriksaanLaboratorium extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextCustom(
                text: 'Pemeriksaan Lab',
                fontSize: 35,
              ),
              SizedBox(height: 30),
              TextCustom(
                fontSize: 20,
                text:
                    'Fitur ini membantu Anda melihat hasil lab dan menghitungnya.',
              ),
              SizedBox(height: 10),
              Container(
                height: 300,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/hasillab.png',
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Nofitikasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextCustom(
                text: 'Notifikasi',
                fontSize: 35,
              ),
              SizedBox(height: 30),
              TextCustom(
                fontSize: 20,
                text:
                    'Fitur ini membantu kamu mengetahui kapan waktu yang tepat untuk mengonsumsi makanan, beristirahat dan berolahraga',
              ),
              SizedBox(height: 10),
              Container(
                height: 300,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/notif.png',
                      ),
                    )),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
