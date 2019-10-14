import 'dart:io';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthDio extends Dio {
  static Future<Dio> getDio() async {
    //
    // Token
    //
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = await prefs.get("token");

    //
    // Request
    //
    Dio dio = new Dio();
    dio.options.headers = {'Authorization': 'Bearer ' + token};
    dio.options.contentType = ContentType.parse("application/json");

    return dio;
  }
}
