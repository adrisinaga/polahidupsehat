import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  
  static const IS_AUTHENTICATED = "isAuthenticated";
  static const ACCOUNT = "account";
  static const NAME = "name";
  static const GENDER = "gender";
  static const TANGGAL_LAHIR = "tanggal_lahir";
  static const API_TOKEN = "apiToken";

  static setAuthenticated(bool data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(IS_AUTHENTICATED, data);
  }
  
  static Future<bool> isAuthenticated() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(IS_AUTHENTICATED) ?? false;
  }

  //DATA ID USER
  static setAccount(String data) async {
    logoutUserSP();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(ACCOUNT, data);
  }
  
  static Future<String> getAccount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(ACCOUNT);
  }

  //DATA GENDER
  static setGender(String data)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(GENDER, data);
  }

  static Future<String> getGender() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(GENDER);
  }

  //DATA NAME
  static setName(String data)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(NAME, data);
  }

  static Future<String> getName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(NAME);
  }

  //DATA TANGGAL LAHIR
  static setTglLahir(String data)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(TANGGAL_LAHIR, data);
  }

  static Future<String> getTanggalLahir() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(TANGGAL_LAHIR);
  }

  static logoutUserSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Remove String
    prefs.remove("id_user");
  }
  
  static clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}