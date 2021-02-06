import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:pola_hidup_sehat/controller/login_controller.dart';
import 'package:pola_hidup_sehat/controller/register_controller.dart';
import 'package:pola_hidup_sehat/controller/sign_in_google.dart';
import 'package:pola_hidup_sehat/widget/color.dart';
import 'package:pola_hidup_sehat/widget/lottiefiles.dart';
import 'package:pola_hidup_sehat/widget/text.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final LoginController _loginController = Get.put(LoginController());
  final RegisterController _registerController = Get.put(RegisterController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(title: Text('Login')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: AppColor.primary,
            child: Column(
              children: <Widget>[
                Container(
                  height: Get.height / 2.4,
                  width: Get.width / 3,
                  // decoration: BoxDecoration(
                  //   image: DecorationImage(
                  //     image: AssetImage('assets/logo_heart.png'),
                  //   ),
                  // ),
                  child: LottieFilesHeartBeart(),
                ),
                // TextCustom(text: 'Hearthealty',fontWeight: FontWeight.bold,fontSize: 25),
                Container(
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 5.0, bottom: 15, left: 10, right: 10),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: TextCustom(text:
                                "Login",
                                fontSize: 25,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 15.0, right: 14, left: 14, bottom: 8),
                              child: TextFormField(
                                controller:
                                    _loginController.emailTextController,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                  ),
                                  hintText: "Email",
                                  hintStyle: TextStyle(fontSize: 15),
                                  contentPadding: EdgeInsets.fromLTRB(
                                      20.0, 15.0, 20.0, 15.0),
                                ),
                                cursorColor: Colors.black,
                                keyboardType: TextInputType.emailAddress,
                                inputFormatters: [
                                  BlacklistingTextInputFormatter
                                      .singleLineFormatter,
                                ],
                                validator: (value) => value.trim().isEmpty
                                    ? 'Email Required'
                                    : null,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 5.0, right: 14, left: 14, bottom: 8),
                              child: TextFormField(
                                controller:
                                    _loginController.passwordTextController,
                                obscureText: true,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                                validator: (value) => value.trim().isEmpty
                                    ? 'Password Required'
                                    : null,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                  ),
                                  hintText: "Password",
                                  contentPadding: EdgeInsets.fromLTRB(
                                      20.0, 15.0, 20.0, 15.0),
                                  hintStyle: TextStyle(fontSize: 15),

                                  // suffixIcon: IconButton(
                                  //     icon: Icon(
                                  //       Icons.visibility,
                                  //       color: Color(0xFFE6E6E6),
                                  //     ),
                                  //     onPressed: () {}),
                                ),
                                cursorColor: Colors.black,
                                inputFormatters: [
                                  BlacklistingTextInputFormatter
                                      .singleLineFormatter,
                                ],
                              ),
                            ),SizedBox(
                              height: 16,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 5.0, right: 14, left: 14, bottom: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextCustom(
                                    text: 'Belum punya akun? ',
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        Get.toNamed('/register');
                                      },
                                      child: TextCustom(
                                        text: 'Daftar disini',
                                        fontWeight: FontWeight.bold,
                                      )),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 5.0, right: 14, left: 14, bottom: 8),
                              child: MaterialButton(
                                color: AppColor.accent,
                                splashColor: Colors.white,
                                height: 45,
                                minWidth: Get.width ,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  'Login',
                                  style: GoogleFonts.exo2(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    _loginController.apiLogin();
                                  }
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 5.0, right: 14, left: 14, bottom: 8),
                              child: InkWell(
                                child: Container(
                                    width: Get.width,
                                    height: Get.height / 18,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.black),
                                    child: Center(
                                        child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          height: 30.0,
                                          width: 30.0,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/google_logo.png'),
                                                fit: BoxFit.cover),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        Text(
                                          'Sign in with Google',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ))),
                                onTap: ()  {
                                  signInWithGoogle().then((result) {
                                    if (result != null) {

                                      ///Check is email registered or not
                                      print('Ini email nya /loginScreen ::: $emailData');
                                      _registerController.checkingEmail(
                                        email: emailData,
                                        pass: '123',
                                      );
                                    }
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // body: Container(
      //   padding: EdgeInsets.all(16),
      //   child: Form(
      //     key: _formKey,
      //     child: ListView(
      //       shrinkWrap: true,
      //       children: [
      //         TextFormField(
      //           controller: _loginController.emailTextController,
      //           keyboardType: TextInputType.emailAddress,
      //           decoration: InputDecoration(
      //             fillColor: Colors.grey[200],
      //             filled: true,
      //             hintText: 'Email',
      //             hintStyle: GoogleFonts.exo2(
      //               fontSize: 16,
      //               color: Colors.grey,
      //               fontWeight: FontWeight.normal,
      //             ),
      //             border: OutlineInputBorder(
      //               borderRadius: BorderRadius.circular(10),
      //               borderSide: BorderSide(color: Colors.transparent, width: 0),
      //             ),
      //             enabledBorder: OutlineInputBorder(
      //               borderRadius: BorderRadius.circular(10),
      //               borderSide: BorderSide(color: Colors.transparent, width: 0),
      //             ),
      //           ),
      //           style: GoogleFonts.exo2(
      //               fontSize: 16,
      //               color: Colors.black87,
      //               fontWeight: FontWeight.normal),
      //           validator: (value) =>
      //               value.trim().isEmpty ? 'Email Required' : null,
      //         ),
      //         SizedBox(
      //           height: 16,
      //         ),
      //         TextFormField(
      //           controller: _loginController.passwordTextController,
      //           keyboardType: TextInputType.text,
      //           obscureText: true,
      //           decoration: InputDecoration(
      //             filled: true,
      //             fillColor: Colors.grey[200],
      //             hintText: 'Password',
      //             hintStyle: GoogleFonts.exo2(
      //               fontSize: 16,
      //               color: Colors.grey,
      //               fontWeight: FontWeight.normal,
      //             ),
      //             border: OutlineInputBorder(
      //                 borderRadius: BorderRadius.circular(10),
      //                 borderSide: BorderSide(
      //                   color: Colors.transparent,
      //                   width: 0,
      //                 )),
      //             enabledBorder: OutlineInputBorder(
      //               borderRadius: BorderRadius.circular(10),
      //               borderSide: BorderSide(
      //                 color: Colors.transparent,
      //                 width: 0,
      //               ),
      //             ),
      //           ),
      //           validator: (value) =>
      //               value.trim().isEmpty ? 'Password required' : null,
      //           style: GoogleFonts.exo2(
      //             fontSize: 16,
      //             color: Colors.black87,
      //             fontWeight: FontWeight.normal,
      //           ),
      //         ),
      //         SizedBox(
      //           height: 16,
      //         ),
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.end,
      //           children: [
      //             TextCustom(
      //               text: 'Belum punya akun ? ',
      //               color: Colors.black87,
      //             ),
      //             GestureDetector(
      //                 onTap: () {
      //                   Get.toNamed('/register');
      //                 },
      //                 child: TextCustom(
      //                   text: 'Daftar disini',
      //                   color: Colors.black,
      //                   fontWeight: FontWeight.bold,
      //                 )),
      //           ],
      //         ),
      //         SizedBox(
      //           height: 16,
      //         ),
      //         MaterialButton(
      //           color: Colors.deepOrangeAccent,
      //           splashColor: Colors.white,
      //           height: 45,
      //           minWidth: Get.width / 2,
      //           shape: RoundedRectangleBorder(
      //             borderRadius: BorderRadius.circular(10),
      //           ),
      //           child: Text(
      //             'Login',
      //             style: GoogleFonts.exo2(
      //               fontSize: 20,
      //               color: Colors.white,
      //               fontWeight: FontWeight.bold,
      //             ),
      //           ),
      //           onPressed: () {
      //             if (_formKey.currentState.validate()) {
      //               _loginController.apiLogin();
      //             }
      //           },
      //         ),
      //         Container(
      //           color: Colors.white,
      //           child: Center(
      //             child: Column(
      //               mainAxisSize: MainAxisSize.max,
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: <Widget>[
      //                 SizedBox(height: 50),
      //                 _signInButton(context),
      //               ],
      //             ),
      //           ),
      //         )
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
