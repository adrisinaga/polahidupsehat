import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pola_hidup_sehat/controller/home_controller.dart';
import 'package:pola_hidup_sehat/controller/login_controller.dart';
import 'package:pola_hidup_sehat/http/request.dart';
import 'package:pola_hidup_sehat/http/url.dart';

import 'sign_in_google.dart';

class RegisterController extends GetxController {
  TextEditingController emailTextController;
  TextEditingController passwordTextController;
  TextEditingController namaTextController;
  TextEditingController tanggalLahirController;
  TextEditingController tinggiBadanController;
  TextEditingController beratBadanController;
  TextEditingController alamatController;
  var checkEmail;
  var email;
  var password = ''.obs;
  var _dropdownValue = 'A'.obs;
  var _character = 'Gender.lakilaki'.obs;
  var _riwayatJK = 'RiwayatJantung.iya'.obs;
  var _terapkan = 'Terapkan';
  Map<String, dynamic> body;
  final LoginController _loginController = Get.put(LoginController());

  set passwordNow(String val) {
    password.value = val;
  }

  get riwayatJK => _riwayatJK.value;

  set riwayatJK(String val) {
    _riwayatJK.value = val;
    print('Riwayat JK in Register Controller = ' + _riwayatJK.value);
  }

  get dropdownValue => _dropdownValue.value;

  set dropdownValue(String val) {
    _dropdownValue.value = val;
  }

  get character => _character.value;

  set character(String val) {
    _character.value = val;
  }

  @override
  void onInit() {
    namaTextController = TextEditingController();
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
    tanggalLahirController = TextEditingController();
    tinggiBadanController = TextEditingController();
    beratBadanController = TextEditingController();

    alamatController = TextEditingController();
    super.onInit();
  }

  void toIsiData({String email, String pass}) {
    emailTextController.text = email;
    passwordTextController.text = pass;

    Get.toNamed('/isidatadiri');
  }

  void checkingEmail({String email, String pass}) {
    emailTextController.text = email;
    passwordTextController.text = pass;

    Request request = Request(url: urlLogin, body: {
      'email_user': emailData,
      'password_user': '123',
    });

    request.post().then((value) {
      body = jsonDecode(value.body);
      print('Check Data /registerController ::: ' + body['data'].toString());
      if (body['data'] == null) {

        ///Email tidak ditemukan
        ///Lanjutkan isi data diri

        print(' /registercontroller Email tidak ditemukan');
        Get.toNamed('/isidatadiri');
      } else {
        body['data'].forEach((data) async {
          checkEmail = true;
          passwordNow = data['password_user'].toString();

          ///Email ditemukan
          ///Maka lanjutkan login

          print('/registercontroller Email ditemukan');
          print('Password /register_controller ::: ${password.value}');
          _loginController.apiLogin(email: emailData, password: password.value);
        });
      }
    });
  }

  //register data diri user
  void apiRegister(String page) async {
    Get.dialog(
      Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );

    //Ubah string jenis kelamin
    if (character == 'Gender.lakilaki') {
      character = 'Laki-laki';
    } else {
      character = 'Perempuan';
    }
    if (riwayatJK == 'RiwayatJantung.iya') {
      riwayatJK = 'Ya';
    } else {
      riwayatJK = 'Tidak';
    }
    if (page == '/mainMenu') {
      _terapkan = 'Terapkan';
    } else {
      _terapkan = 'Tidak';
    }

    print('Email : ' +
        emailTextController.text +
        ', password : ' +
        passwordTextController.text +
        ', nama :' +
        namaTextController.text +
        ', tanggalLahir : ' +
        tanggalLahirController.text +
        ', tinggiBadan : ' +
        tinggiBadanController.text +
        ', beratBadan : ' +
        beratBadanController.text +
        ', Golongan Darah : ' +
        dropdownValue +
        ', jnsKelamin : ' +
        character +
        ', alamat : ' +
        alamatController.text +
        ', riwayatJK : ' +
        riwayatJK +
        ', terapkan : ' +
        _terapkan);

    Request request = Request(url: urlRegister, body: {
      'email_user': emailTextController.text,
      'password_user': passwordTextController.text,
      'nama_user': namaTextController.text,
      'tglLahir_user': tanggalLahirController.text,
      'tinggiBadan_user': tinggiBadanController.text,
      'beratBadan_user': beratBadanController.text,
      'jKelamin_user': character,
      'alamat_user': alamatController.text,
      'golDarah_user': dropdownValue,
      'riwayatJK_user': riwayatJK,
      'terapkanPHS_user': _terapkan,
    });

    request.post().then((value) {
      // print(value.statusCode);
      body = jsonDecode(value.body);

      if (body['status'] == 'Success') {
        print(body['data']);
        print(body['message']);

        _loginController.apiLogin(
            email: emailTextController.text,
            password: passwordTextController.text);
      } else {
        print(body['error']);
        Get.defaultDialog(
            title: "Salah Data Input",
            middleText: "${body['error']}",
            actions: [
              FlatButton(
                child: Text('Baik'),
                onPressed: () {
                  Get.back();
                  Get.back();
                },
              ),
            ]);
      }
    }).catchError((onError) {
      printError();
    });
  }

  @override
  void dispose() {
    namaTextController?.dispose();
    emailTextController?.dispose();
    passwordTextController?.dispose();
    tanggalLahirController?.dispose();
    alamatController?.dispose();
    dropdownValue = null;
    character = null;
    riwayatJK = null;
    super.dispose();
  }
}
