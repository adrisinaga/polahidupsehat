import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pola_hidup_sehat/controller/hitungBMI_controller.dart';
import 'package:pola_hidup_sehat/widget/button.dart';
import 'package:pola_hidup_sehat/widget/color.dart';
import 'package:pola_hidup_sehat/widget/dropdown.dart';
import 'package:pola_hidup_sehat/widget/lottiefiles.dart';
import 'package:pola_hidup_sehat/widget/text.dart';
import 'package:pola_hidup_sehat/widget/textformfield.dart';

class HitungKaloriScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final HitungBmiController _hitungBmiController =
      Get.put(HitungBmiController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Stack(
          children: [
            Container(
              color: AppColor.primary,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(
                children: [
                  Center(
                    child: TextCustom(
                      text: 'Hitung Kebutuhan Kalori',
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                      height: 30
                  ),
                  LottieFilesHitungKalori(),
                  SizedBox(
                    height: 30
                  ),
                  TextCustom(
                    text: 'Penjelasan : ',
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextCustom(
                    text: 'Kebutuhan kalori harian adalah jumlah kalori yang dibutuhkan oleh tubuh Anda setiap hari, untuk menjalankan fungsi utama tubuh, dan untuk melakukan aktivitas sehari-hari. Kebutuhan kalori harian ini bisa Anda gunakan sebagai acuan berapa banyak makanan yang harus Anda konsumsi per harinya. Kebutuhan kalori harian didapat dari angka BMR yang dikalikan dengan faktor aktivitas fisik.',
                    color: Colors.black87,
                    fontWeight: FontWeight.normal,
                    fontSize: 13,
                  ),
                  SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(color: Colors.black54),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 16),
                            TextCustom(
                              text: 'Berat Badan',
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                            SizedBox(height: 10),
                            TextFormFieldCustom(
                              hintText: 'Berat Badan',
                              textInputType: TextInputType.number,
                              textEditingController:
                                  _hitungBmiController.beratBadanController,
                            ),
                            SizedBox(height: 16),
                            TextCustom(
                              text: 'Tinggi Badan',
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                            SizedBox(height: 10),
                            TextFormFieldCustom(
                              hintText: 'Tinggi Badan',
                              textInputType: TextInputType.number,
                              textEditingController:
                                  _hitungBmiController.tinggiBadanController,
                            ),
                            SizedBox(height: 16),
                            TextCustom(
                              text: 'Umur',
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                            SizedBox(height: 10),
                            TextFormFieldCustom(
                              hintText: 'Umur',
                              textInputType: TextInputType.number,
                              textEditingController:
                                  _hitungBmiController.umurController,
                            ),
                            SizedBox(height: 16),
                            TextCustom(
                              text: 'Pilih Aktivitas',
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                            DropdownAktivitas(),
                            SizedBox(height: 16),
                            Center(
                              child: MaterialButtonCustom(
                                buttonText: 'Hitung',
                                color: Colors.redAccent,
                                onTap: () {
                                  if (_formKey.currentState.validate()) {
                                    _hitungBmiController.calculateBMI();
                                  }
                                },
                              ),
                            ),
                            SizedBox(height: 8),
                            Center(
                              child: MaterialButtonCustom(
                                buttonText: 'Clear',
                                color: Colors.greenAccent,
                                onTap: () {
                                  // if (_formKey.currentState.validate()) {
                                  //   _hitungBmiController.calculateBMI();
                                  // }
                                  _hitungBmiController.onClear();
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
