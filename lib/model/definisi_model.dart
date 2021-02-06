// To parse this JSON data, do
//
//     final definisiModel = definisiModelFromJson(jsonString);

import 'dart:convert';

DefinisiModel definisiModelFromJson(String str) => DefinisiModel.fromJson(json.decode(str));

String definisiModelToJson(DefinisiModel data) => json.encode(data.toJson());

class DefinisiModel {
  DefinisiModel({
    this.status,
    this.statusCode,
    this.data,
  });

  String status;
  String statusCode;
  List<Datum> data;

  factory DefinisiModel.fromJson(Map<String, dynamic> json) => DefinisiModel(
    status: json["status"],
    statusCode: json["statusCode"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "statusCode": statusCode,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.idDefinisi,
    this.kategoriDefinisi,
    this.judulAwalDefinisi,
    this.judulDefinisi,
    this.isiDefinisi,
    this.gambarDefinisi,
  });

  String idDefinisi;
  String kategoriDefinisi;
  String judulAwalDefinisi;
  String judulDefinisi;
  String isiDefinisi;
  String gambarDefinisi;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    idDefinisi: json["id_definisi"],
    kategoriDefinisi: json["kategori_definisi"],
    judulAwalDefinisi: json["judulAwal_definisi"],
    judulDefinisi: json["judul_definisi"],
    isiDefinisi: json["isi_definisi"],
    gambarDefinisi: json["gambar_definisi"],
  );

  Map<String, dynamic> toJson() => {
    "id_definisi": idDefinisi,
    "kategori_definisi": kategoriDefinisi,
    "judulAwal_definisi": judulAwalDefinisi,
    "judul_definisi": judulDefinisi,
    "isi_definisi": isiDefinisi,
    "gambar_definisi": gambarDefinisi,
  };
}
