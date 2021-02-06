import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pola_hidup_sehat/http/request.dart';
import 'package:pola_hidup_sehat/http/url.dart';
import 'package:pola_hidup_sehat/utility/shared_preferences.dart';

class LoginController extends GetxController {
  TextEditingController emailTextController;
  TextEditingController passwordTextController;

  Map<String, dynamic> body;
  Map<String, dynamic> dataBody;

  @override
  void onInit() {
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
    super.onInit();
  }

  void apiLogin({String email, String password}) async {
    print(' /logincontroller Email dan Password yang ingin login ::: $email $password');
    Request request = Request(url: urlLogin, body: {
      'email_user': (email == null) ? emailTextController.text : email,
      'password_user':
          (password == null) ? passwordTextController.text : password,
      // 'email_user':emailTextController.text,
      // 'password_user':passwordTextController.text,
    });
    print(
        'Email dan Password yang ingin login ::: ${emailTextController.text} ${passwordTextController.text}');

    request.post().then((value) {
      body = jsonDecode(value.body);
      print('Body Data /logincontroller ::: ' + body['data'].toString());

      if (body['status'] == 'Success') {
        body['data'].forEach((data) async {
          //Simpan id user
          await SharedPreferencesHelper.setAccount(data['id_user']);
          await SharedPreferencesHelper.setName(data['nama_user']);
          await SharedPreferencesHelper.setGender(data['jKelamin_user']);
          await SharedPreferencesHelper.setTglLahir(data['tglLahir_user']);
          print('ID User :::' + data['id_user']);
          print('Nama User :::' + data['nama_user']);
          print('Jenis Kelamin User :::' + data['jKelamin_user']);
          print('Tgl Lahir User :::' + data['tglLahir_user']);

          if (data['terapkanPHS_user'] == 'Terapkan') {
            Get.offAllNamed('/mainMenu');
          } else {
            Get.offAllNamed('/berandafitur');
          }
        });
      } else {
        print('error login');
      }
      update();
    }).catchError((onError) {
      printError();
    });
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void dispose() {
    emailTextController?.dispose();
    passwordTextController?.dispose();
    super.dispose();
  }
}
