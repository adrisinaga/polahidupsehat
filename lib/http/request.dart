import 'package:http/http.dart' as http;
import 'package:pola_hidup_sehat/http/url.dart';

class Request{
  final String url;
  final dynamic body;

  Request({this.url,this.body});

  Future<http.Response> post() {
    return http.post(urlBase+url, body: body).timeout(Duration(minutes: 2));
  }

  Future<http.Response> get(){
    return http.get(urlBase+url).timeout(Duration(minutes: 2));
  }
}