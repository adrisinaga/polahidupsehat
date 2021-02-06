
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pola_hidup_sehat/model/screenargument_model.dart';
import 'package:pola_hidup_sehat/screen/beranda/beranda_pagescreen.dart';
import 'package:pola_hidup_sehat/widget/button.dart';
import 'package:pola_hidup_sehat/widget/text.dart';

class DeskripsiScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          // title: Text((Get.arguments != null) ? Get.arguments : ''),
          title: Text(args.judulAwalDefinisi),
          floating: false,
          pinned: true,
          snap: false,
          expandedHeight: height / 90,

          // flexibleSpace: ClipRRect(
          //   child: Image.network(
          //     "https://images.unsplash.com/photo-1530026405186-ed1f139313f8?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80",
          //     fit: BoxFit.cover,
          //   ),
          // ),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          Container(
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0, left: 20, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextCustom(
                    text: args.judulDefinisi,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: height / 50,
                  ),
                  Html(
                    data: """${args.isiDefinisi}""",
                    //Optional parameters:
                    // backgroundColor: Colors.white70,
                    style: {
                      "div": Style(fontSize: FontSize(250),
                        fontStyle: FontStyle.normal,
                      ),
                    },
                    onImageTap: (src) {
                      // Display the image in large form.
                    },
                  ),
                  SizedBox(
                    height: height / 50,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: MaterialButtonCustom(
                      buttonText: 'Baik, bermanfaat',
                      color: Colors.redAccent,
                      onTap: () {
                        Get.back();
                      },
                    ),
                  ),
                  SizedBox(
                    height: height / 50,
                  ),
                ],
              ),
            ),
          ),
        ]))
      ],
    ));
  }
}
