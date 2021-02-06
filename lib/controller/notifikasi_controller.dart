import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pola_hidup_sehat/http/request.dart';
import 'package:pola_hidup_sehat/http/url.dart';
import 'package:pola_hidup_sehat/model/notifikasi_model.dart';

class NotifikasiController extends GetxController {
  Map<String, dynamic> body;
  var notifikasiList = List<Data>().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getNotifikasi();
    super.onInit();
  }

  getNotifikasi() async {
    Request request = Request(url: urlGetNotifikasi);

    request.post().then((value) {
      body = jsonDecode(value.body);
      print('Body Status /homecontroller ' + body['status']);

      if (body['status'] == 'Success') {
        NotifikasiModel notifikasiModel =
            NotifikasiModel.fromJson(json.decode(value.body));

        notifikasiList.value = notifikasiModel.data;
        print(notifikasiModel.data.map((e) => e.judulNotifikasi));
        update();
      } else {
        print('Backend bermasalah, hubungi developer');
      }
    }).catchError((onError) {
      printError();
      // print('error');
    });
  }
}
