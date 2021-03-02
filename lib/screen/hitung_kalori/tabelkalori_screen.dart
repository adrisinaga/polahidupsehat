import 'package:flutter/material.dart';
import 'package:pola_hidup_sehat/widget/color.dart';
import 'package:pola_hidup_sehat/widget/text.dart';

class TabelKaloriScreen extends StatelessWidget {
  static List<TabelKalori> makananPokokGolonganA = [
    TabelKalori('Jagung Rebus', 250, 90.2, 1),
    TabelKalori('Kentang Rebus', 200, 166, 2),
    TabelKalori('Ketan Putih', 120, 217, 2.75),
    TabelKalori('Ketupat', 160, 32, 0.5),
    TabelKalori('Lontong', 200, 38, 0.5),
    TabelKalori('Nasi Putih', 100, 175, 2.25),
    TabelKalori('Nasi Putih Kentucky', 225, 349, 4.25),
    TabelKalori('Roti Tawar Serat Tinggi', 60, 149, 1.75),
    TabelKalori('Singkong Rebus', 100, 146, 1.75),
    TabelKalori('Talas Rebus', 100, 98, 1.25),
    TabelKalori('Ubi Rebus', 100, 125, 1.5),
  ];

  static List<TabelKalori> makananPokokGolonganB = [
    TabelKalori('Bubur', 200, 44, 0.5),
    TabelKalori('Crakers', 50, 229, 2.75),
    TabelKalori('Makaroni', 25, 91, 1.25),
    TabelKalori('Mie Instant', 50, 168, 2),
    TabelKalori('Nasi Tim', 100, 88, 1),
    TabelKalori('Nasi Uduk', 200, 506, 6.25),
    TabelKalori('Roti Tawar', 50, 128, 1.5),
  ];

  static List<TabelKalori> makananPokokGolonganC = [
    TabelKalori('Bihun Goreng', 150, 296, 3.75),
    TabelKalori('Bubur Ayam', 200, 165, 2),
    TabelKalori('Bubur Sum-sum', 100, 178, 2.25),
    TabelKalori('Kentang Goreng', 150, 211, 2.75),
    TabelKalori('Mie Goreng', 200, 321, 4),
    TabelKalori('Nasi Goreng', 100, 267, 3.25),
    TabelKalori('Soun Goreng', 100, 263, 3.25),
    TabelKalori('Spaghetti', 300, 642, 8),
    TabelKalori('Tape singkong', 150, 260, 3.25),
  ];

  static List<TabelKalori> laukPaukGolonganA = [
    TabelKalori('Arsik', 95, 94.05, 1),
    TabelKalori('Ayam Bakar Bumbu Kuning', 100, 129.4, 1.5),
    TabelKalori('Ayam Panggang', 100, 164.3, 3.25),
    TabelKalori('Daging Panggang', 70, 150, 1.75),
    TabelKalori('Ikan Mas Pepes', 200, 143.5, 1.75),
    TabelKalori('Sambal Goreng Tempe', 50, 116, 1.5),
    TabelKalori('Telur Asin Rebus', 75, 138, 1.75),
    TabelKalori('Telur Ayam Rebus', 60, 97, 1.25),
    TabelKalori('Udang Rebus', 100, 91, 1.25),
  ];

  static List<TabelKalori> laukPaukGolonganB = [
    TabelKalori('Ati Ayam Goreng',	50,	98,	1.25),
    TabelKalori('Ayam Pop',	200,	265,	3.25),
    TabelKalori('Bakso Daging Sapi',	100,	260,	3.25),
    TabelKalori('Empal Daging',	100,	147,	1.75),
    TabelKalori('Ikan Bandeng Goreng',	160	,180.7,	2.25),
    TabelKalori('Ikan Baronang Goreng',	120,	107.5,	1.25),
    TabelKalori('Ikan Bawal Goreng',	120,	113.3,	1.5),
    TabelKalori('Ikan Ekor Goreng',	100,	107.8,	1.25),
    TabelKalori('Ikan Kembung Goreng',	80,	87.65,	1),
    TabelKalori('Ikan Lele Goreng',	60,	57.5,	0.75),
    TabelKalori('Ikan Patin Goreng',	200	,252.7,	3),
    TabelKalori('Ikan Selar Goreng',	40,	63.75,	0.75),
    TabelKalori('Ikan Tenggiri Goreng',	60,	85.3,	1),
    TabelKalori('Ikan Teri Goreng',	50,	66,	0.75),
    TabelKalori('Ikan Tuna Goreng	',60	,110	,1.25),
    TabelKalori('Kerang Rebus',	100	,59,	0.75),
    TabelKalori('Macaroni Schootel',	50,	177,	2.25),
    TabelKalori('Tahu Bacem',	100,	147,	1.75),
    TabelKalori('Telur Mata Sapi',	60,	40,	1.75),
    TabelKalori('Tempe Bacem',	50,	157,	2),
    TabelKalori('Tempe Goreng',	50,	118	,1.5),
    TabelKalori('Tenggiri Bumbu Kuning',	90,	94.4,	1),
    TabelKalori('Udang Goreng Besar',	80,	68.25	,3.25),
  ];

  static List<TabelKalori> laukPaukGolonganC = [
    TabelKalori('Abon Sapi',	50,	158,	2),
    TabelKalori('Ayam Goreng Kecap',	75,	358.8,	4.5),
    TabelKalori('Ayam Panggang',	80,	385.6,	4.75),
    TabelKalori('Chiken Wing / Sayap Ayam',	50,	63.6,	0.75),
    TabelKalori('Daging Balado',	50,	147,	1.75),
    TabelKalori('Dendeng Balado',	40,	338,	4.25),
    TabelKalori('Gulai Ayam',	100,	165.3,	2),
    TabelKalori('Gulai Cumi',	100,	183,	2.25),
    TabelKalori('Gulai Kepala Ikan Kakap',	320,	218.8,	2.75),
    TabelKalori('Gulai Limpa',	60,	294,	3.5),
    TabelKalori('Gulai Tunjang',	80,	251,	3),
    TabelKalori('Ikan Kembung Balado',	125,	236.7,	3),
    TabelKalori('Ikan Teri',	50,	213,	2.75),
    TabelKalori('Kakap Goreng Tepung',	80,	119,	1.5),
    TabelKalori('Kakap Panir',	75,	220,	2.75),
    TabelKalori('Keripik Tempe',	25,	68,	0.75),
    TabelKalori('Meat Ball / Daging Cincang Bulat',	50,	168,	2),
    TabelKalori('Ayam Kentucky Paha Atas',	150,	194.5,	2.5),
    TabelKalori('Perkedel Jagung',	50,	108,	1.25),
    TabelKalori('Perkedel Kentang',	50,	123,	1.5),
    TabelKalori('Pu Yung Hai',	50,	114,	1.5),
    TabelKalori('Rendang Daging',	75,	285.5,	3.5),
    TabelKalori('Sate Ayam',	100,	466,	6),
    TabelKalori('Ayam Kentucky Sayap',	150,	116,	1.5),
    TabelKalori('Semur Ayam',	50,	177.8,	2.25),
    TabelKalori('Sambal Goreng Ati + Kentang',	100,	127,	1.5),
    TabelKalori('Sambal Goreng Tempe Teri',	150,	276	,3.5),
    TabelKalori('Sambal Goreng Ati Sapi',	100,	200	,2.5),
    TabelKalori('Sambal Goreng Udang + Kentang',	100,	123,	1.5),
    TabelKalori('Sop Sapi',	260,	227,	2.75),
    TabelKalori('Tahu Goreng',	100,	111,	1.5),
    TabelKalori('Tahu Isi',	150,	124,	1.5),
    TabelKalori('Tahu Sumedang',	100,	113,	1.5),
    TabelKalori('Telur dadar',	75,	188,	2.25),
  ];

  static List<TabelKalori> sayuranGolonganA = [
    TabelKalori('Acar Kuning',	75,	53,	0.5),
    TabelKalori('Bening Bayam',	50,	18,	0.25),
    TabelKalori('Cah Labu Siam',	100,	41.6,	0.5),
    TabelKalori('Sayur Asam',	100,	88,	1),
    TabelKalori('Sop Ayam Kombinasi',	100,	95,	1.25),
    TabelKalori('Sop Bayam',	50,	78,	1),
    TabelKalori('Sop Kimlo',	100,	104,	1.25),
    TabelKalori('Sop Mutiara Jagung',	100,	113,	1.5),
    TabelKalori('Asop Oyong Misoa',	100,	106,	1.25),
    TabelKalori('Sop Telur Putuh',	100	,116,	1.5),
  ];

  static List<TabelKalori> sayuranGolonganB = [
    TabelKalori('Sayur Lodeh',	100	,61,	0.75),
    TabelKalori('Cah Jagung Putren',	100,	59,	0.75),
    TabelKalori('Cah Jkacang Panjang',	100,	72,	1),
    TabelKalori('Sop Oyong Telur Puyuh',	100,	134,	1.75),
    TabelKalori('Setup Kentang Buncis',	100,	95,	1),
    TabelKalori('Tumis Buncis',	100,	52,	1.5),
    TabelKalori('Tumis Daun Singkong',	120,	151,	1.75),
    TabelKalori('Tumis Kc. Panjang + Jagung	',125,	118,	1.75),
  ];

  static List<TabelKalori> sayuranGolonganC = [
    TabelKalori('Buntil',	100	,106	,1.25),
    TabelKalori('Gudeg',	150,	132,	1.75),
  ];

  static List<TabelKalori> buahbuahanGolonganA = [
    TabelKalori('Apel',	160,	92,	1),
    TabelKalori('Apel Merah',	140	,82,	1),
    TabelKalori('Belimbing',	160,	80,	0.75),
    TabelKalori('Duku',	200,	81,	1),
    TabelKalori('Jambu Air',	60,	35.4,	0.5),
    TabelKalori('Jambu Biji',	320,	157,	2),
    TabelKalori('Jeruk Medan',	140	,46	,0.5),
    TabelKalori('Jeruk Pontianak',	150,	67,	0.75),
    TabelKalori('Jeruk Sunkist',	200,	40,	0.5),
    TabelKalori('Mangga Manalagi',	100,	72,	1),
    TabelKalori('Nanas',	200	,104,	1.25),
    TabelKalori('Pepaya',	100,	46,	0.5),
    TabelKalori('Pir',	200,	80,	1),
    TabelKalori('Pisang Rebus',	125,	136.5,	1.75),
    TabelKalori('Salak',	150	,63.6	,0.75),
    TabelKalori('Semangka',	150,	48,	0.5),
  ];

  static List<TabelKalori> buahbuahanGolonganB = [
    TabelKalori('Alpukat',	100,	85,	1),
    TabelKalori('Anggur',	125,	60,	0.75),
    TabelKalori('Lengkeng',	100,	79,	1),
    TabelKalori('Melon',	120,	46,	0.5),
    TabelKalori('Mangga Harum Manis',	300,	90,	1),
    TabelKalori('Pir Hijau',	200,	105,	1.25),
    TabelKalori('Pisang Ambon',	100,	74.2,	1),
    TabelKalori('Pisang Barangan',	200,	236,	3),
    TabelKalori('Pisang Mas',	125,	120,	1.5),
    TabelKalori('Pisang Raja',	150,	126,	1.5),
    TabelKalori('Sirsak',	125,	55,	0.25),
  ];

  static List<TabelKalori> buahbuahanGolonganC = [
    TabelKalori('Durian Montong',	100,	134,	1.5),
    TabelKalori('Rambutan',	100,	69,	0.75),
    TabelKalori('Sawo',	100	,92	,1.75),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tabel Kalori'),
      ),
      body: SafeArea(
        child: Container(
          color: AppColor.primary,
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  TextCustom(text: 'Dari bahan makanan utama, hingga buah-buahan, memiliki jumlah kalori yang berbeda-beda. Untuk menghitung kalori dalam sekali makan, perlu memperhatikan daftar kalori makanan di atas. Hitung asupan kalori untuk mendapatkan energi yang sesuai.',alignment: TextAlign.center,),
                  SizedBox(height: 50),

                  BuildMakananGolongan(jenisTabel: makananPokokGolonganA,judul: 'Makanan Pokok Golongan A'),
                  BuildMakananGolongan(jenisTabel: makananPokokGolonganB,judul: 'Makanan Pokok Golongan B'),
                  BuildMakananGolongan(jenisTabel: makananPokokGolonganC,judul: 'Makanan Pokok Golongan C'),
                  BuildMakananGolongan(jenisTabel: laukPaukGolonganA,judul: 'Lauk Pauk Golongan A'),
                  BuildMakananGolongan(jenisTabel: laukPaukGolonganB,judul: 'Lauk Pauk Golongan B'),
                  BuildMakananGolongan(jenisTabel: laukPaukGolonganC,judul: 'Lauk Pauk Golongan C'),
                  BuildMakananGolongan(jenisTabel: sayuranGolonganA,judul: 'Sayuran Golongan A'),
                  BuildMakananGolongan(jenisTabel: sayuranGolonganB,judul: 'Sayuran Golongan B'),
                  BuildMakananGolongan(jenisTabel: sayuranGolonganC,judul: 'Sayuran Golongan C'),
                  BuildMakananGolongan(jenisTabel: buahbuahanGolonganA,judul: 'Sayuran Golongan A'),
                  BuildMakananGolongan(jenisTabel: buahbuahanGolonganB,judul: 'Sayuran Golongan B'),
                  BuildMakananGolongan(jenisTabel: buahbuahanGolonganC,judul: 'Sayuran Golongan C'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BuildMakananGolongan extends StatelessWidget {
  const BuildMakananGolongan({
    Key key,
    @required this.jenisTabel,
    @required this.judul,
  }) : super(key: key);

  final List<TabelKalori> jenisTabel;
  final String judul;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpansionTile(
          title: Text(judul),
          children: [
            DataTable(columnSpacing: 40,
              columns: <DataColumn>[
                DataColumn(
                    label: FittedBox(
                        fit: BoxFit.contain,
                        child: TextCustom(
                          text: "Nama Masakan",
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          textOverflow: TextOverflow.ellipsis,
                        ))),
                DataColumn(
                    label: FittedBox(
                        fit: BoxFit.contain,
                        child: TextCustom(
                          text: "Berat (gr)",
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          textOverflow: TextOverflow.ellipsis,
                        ))),
                DataColumn(
                    label: FittedBox(
                        fit: BoxFit.contain,
                        child: TextCustom(
                          text: "Kalori",
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ))),
                DataColumn(
                    label: FittedBox(
                        fit: BoxFit.contain,
                        child: TextCustom(
                          text: "Unit",
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ))),
              ],
              rows: jenisTabel
                  .map(
                    (value) => DataRow(
                      cells: [
                        DataCell(
                          TextCustom(
                            text: value.namaMakanan,
                            fontSize: 15,
                          ),
                        ),
                        DataCell(
                          TextCustom(
                            text: value.berat.toString(),
                            fontSize: 15,
                          ),
                        ),
                        DataCell(
                          TextCustom(
                            text: value.kalori.toString(),
                            fontSize: 15,
                          ),
                        ),
                        DataCell(
                          TextCustom(
                            text: value.unit.toString(),
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
        CustomDivider(),
      ],
    );
  }
}

class CustomDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5,bottom: 5),
      height: 2,
      width: double.infinity,
      color: Colors.blueGrey,
    );
  }
}





class TabelKalori {
  final String namaMakanan;
  final double berat;
  final double kalori;
  final double unit;

  TabelKalori(this.namaMakanan, this.berat, this.kalori, this.unit);
}
