// To parse this JSON data, do
//
//     final notifikasi = notifikasiFromJson(jsonString);

import 'dart:convert';

NotifikasiModel notifikasiFromJson(String str) => NotifikasiModel.fromJson(json.decode(str));

String notifikasiToJson(NotifikasiModel data) => json.encode(data.toJson());

class NotifikasiModel {
  NotifikasiModel({
    this.status,
    this.statusCode,
    this.data,
  });

  String status;
  String statusCode;
  List<Data> data;

  factory NotifikasiModel.fromJson(Map<String, dynamic> json) => NotifikasiModel(
    status: json["status"],
    statusCode: json["statusCode"],
    data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "statusCode": statusCode,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Data {
  Data({
    this.idNotifikasi,
    this.judulNotifikasi,
    this.isiNotifikasi,
  });

  String idNotifikasi;
  String judulNotifikasi;
  String isiNotifikasi;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    idNotifikasi: json["id_notifikasi"],
    judulNotifikasi: json["judul_notifikasi"],
    isiNotifikasi: json["isi_notifikasi"],
  );

  Map<String, dynamic> toJson() => {
    "id_notifikasi": idNotifikasi,
    "judul_notifikasi": judulNotifikasi,
    "isi_notifikasi": isiNotifikasi,
  };
}
