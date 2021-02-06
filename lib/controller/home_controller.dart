import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pola_hidup_sehat/controller/sign_in_google.dart';
import 'package:pola_hidup_sehat/http/request.dart';
import 'package:pola_hidup_sehat/http/url.dart';
import 'package:pola_hidup_sehat/model/definisi_model.dart';
import 'package:pola_hidup_sehat/utility/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  PageController _pageController;

  PageController pageController() => _pageController;
  Map<String, dynamic> body;
  var _namaUser = ''.obs;
  var _idUser = ''.obs;
  var _terapkanPHSUser = 'Terapkan'.obs;
  var judulDefinisi = ''.obs;
  var definisiList = List<Datum>().obs;

  get idUser => _idUser;

  set idUser(String val) {
    _idUser.value = val;
    update();
  }

  get nameUser => _namaUser;

  set nameUser(String val) {
    _namaUser.value = val;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    _pageController = PageController();

    // getID();
    // print(idUser.toString());

    getDataUser();
    getDefinisi();
    // _pageController.animateToPage(3, duration: Duration(microseconds: 1), curve: Curves.bounceOut);
    super.onInit();
  }

  getDataUser() async {
    var account = await SharedPreferencesHelper.getAccount();
    print('id user pada home : ${account.toString()}');

    Request request = Request(url: urlDataUser, body: {
      'id_user': account.toString(),
    });

    request.post().then((value) {
      body = jsonDecode(value.body);
      print('Body Status /homecontroller ' + body['status']);

      if (body['status'] == 'Success') {
        print('body data status success ::: ' + body['data'].toString());
        body['data'].forEach((data) {
          print('Nama User: ' + data['nama_user']);
          print('ID User: ' + data['id_user']);
          nameUser = data['nama_user'] ?? null;
          // idUser = int.tryParse(data['id_user']);
          update();
        });
      } else {
        print('Backend bermasalah, hubungi developer');
      }
    }).catchError((onError) {
      printError();
      // print('error');
    });
  }

  getDefinisi() async {
    Request request = Request(url: urlGetDefinisi);

    request.post().then((value) {
      body = jsonDecode(value.body);
      print('Body Status /homecontroller ' + body['status']);

      if (body['status'] == 'Success') {
        DefinisiModel definisiModel =
            DefinisiModel.fromJson(json.decode(value.body));

        definisiList.value = definisiModel.data;
        print(definisiModel.data.map((e) => e.judulDefinisi));
        update();
      } else {
        print('Backend bermasalah, hubungi developer');
      }
    }).catchError((onError) {
      printError();
      // print('error');
    });
  }

  void terapkanPolaHidupSehat() async {
    var account = await SharedPreferencesHelper.getAccount();
    Request request = Request(url: urlUpdateTerapkan, body: {
      'id_user': account,
    });

    request.post().then((value) {
      body = jsonDecode(value.body);
      if (body['status'] == 'Success') {
        print(body['status']);
        print(body['message']);
        Get.defaultDialog(
          title: '',
          middleText: "${body['message']}",
          actions: [
            FlatButton(
              child: Text('Baik'),
              onPressed: () {
                Get.back();
                Get.offNamed('/mainMenu');
              },
            ),
          ],
        );

      } else {
        print(body['error']);
        Get.defaultDialog(
          title: 'Tidak menemukan user',
          middleText: "${body['error']}",
          actions: [
            FlatButton(
              child: Text('Baik'),
              onPressed: () {
                Get.back();
                Get.back();
              },
            ),
          ],
        );
      }
    }).catchError((onError) {
      printError();
    });
  }

  void apiLogout()async{
    await SharedPreferencesHelper.logoutUserSP();
    signOutGoogle();
    Get.offAllNamed('/login');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController?.dispose();
    super.dispose();
  }
}
