import 'package:flutter/material.dart';
import 'package:pola_hidup_sehat/widget/color.dart';
import 'package:pola_hidup_sehat/widget/text.dart';

class KnowledgeLab extends StatelessWidget {
  var listKnowledge = [
    ['Hemaglobin', '13.0-16.0 g/dL'],
    ['Hematokrit', '40-48 %'],
  ];
  List<JenisPemeriksaan> _items = [
    JenisPemeriksaan('Hemoglobin', '13.0 - 16.0 g/dL'),
    JenisPemeriksaan('Hematokrit', '40.0 - 48.0 %'),
    JenisPemeriksaan('Leukosit', '5.000 - 10.000 (/uL)'),
    JenisPemeriksaan('Trombosit', '150.000 - 400.000 (/uL)'),
    JenisPemeriksaan('MCV', '80.0 - 95.0 fl'),
    JenisPemeriksaan('MCH', '26.0 - 34.0 pg'),
    JenisPemeriksaan('MCHC', '32.0 - 36.0'),
    JenisPemeriksaan('Basofil', '0 - 1 %'),
    JenisPemeriksaan('Eosinofil', '0 - 3 %'),
    JenisPemeriksaan('Stab', '2 - 8 (%)'),
    JenisPemeriksaan('Neutrofil', '50 - 70 %'),
    JenisPemeriksaan('Limfosit', '20 - 40 %'),
    JenisPemeriksaan('Monosit', '2 - 8 %'),
    JenisPemeriksaan('LED', '0 - 15 ( mm/jam )'),
    JenisPemeriksaan('Eritrosit', '4.2 - 5.5 ( juta/uL )'),
    JenisPemeriksaan('Kolesterol LDL', '<130 mg/dL'),
    JenisPemeriksaan('Kolesterol HDL', '30 - 70 mg/dL'),
    JenisPemeriksaan('APTT', '31.0 - 47.0 Detik'),
    JenisPemeriksaan('Glukosa Sewaktu', '< 140 mg/dl'),
    JenisPemeriksaan('Kreatinin', '0.6 - 1.2 mg/dL'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nilai Rujukan'),
      ),
      body: SafeArea(
        child: Container(
          color: AppColor.primary,
          child: Center(
            child: SingleChildScrollView(
              child: DataTable(
                columns: <DataColumn>[
                  DataColumn(
                      label: FittedBox(
                          fit: BoxFit.contain,
                          child: TextCustom(
                            text: "Jenis Pemeriksaan",
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ))),
                  DataColumn(
                      label: FittedBox(
                          fit: BoxFit.contain,
                          child: TextCustom(
                            text: "Nilai Rujukan",
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ))),
                ],
                rows: _items
                    .map(
                      (value) => DataRow(
                        cells: [
                          DataCell(
                            TextCustom(
                              text: value.jenis,
                              fontSize: 15,
                            ),
                            // onTap: () {
                            //   print('Selected ${user.firstName}');
                            // },
                          ),
                          DataCell(
                            TextCustom(
                              text: value.nilaiRujukan,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
                // rows: <DataRow>[
                //   DataRow(
                //     cells: <DataCell>[
                //       DataCell(Text("Hemoglobin")),
                //       DataCell(Text("13.0-16.0 g/dL")),
                //     ],
                //   ),
                //   DataRow(
                //     cells: <DataCell>[
                //       DataCell(Text("Hematokrit")),
                //       DataCell(Text("40-48 %")),
                //     ],
                //   ),
                //   DataRow(
                //     cells: <DataCell>[
                //       DataCell(Text("Eclair")),
                //       DataCell(Text("262")),
                //     ],
                //   ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class JenisPemeriksaan {
  String jenis;
  String nilaiRujukan;

  JenisPemeriksaan(this.jenis, this.nilaiRujukan);

  @override
  String toString() {
    return '{ ${this.jenis}, ${this.nilaiRujukan} }';
  }
}
