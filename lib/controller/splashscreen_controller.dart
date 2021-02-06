import 'package:get/get.dart';
import 'package:pola_hidup_sehat/utility/shared_preferences.dart';

class SplashScreenController extends GetxController{
  var userLogin = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void checkUserLogin()async{
    var account = await SharedPreferencesHelper.getAccount();
    /*account detected*/
    // if(account.length>0){
    //   Get.offAllNamed('/mainMenu');
    // }
    // /*no account*/
    // else{
    //   Get.offAllNamed('/login');
    // }
    if(account==''){
      Get.offAllNamed('/mainMenu');
    }else{
      Get.offAllNamed('/login');
    }
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}