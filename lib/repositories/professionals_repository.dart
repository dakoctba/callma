import 'dart:io';

import 'package:callma/models/professional.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfessionalsRepository {
  static Future<List<Professional>> getProfessionals(int professionId) async {
    List<Professional> items = new List<Professional>();

    try {
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

      //
      // Response
      //
      Response response = await dio.get("https://callma-api.herokuapp.com/api/professionals");

      for (Map<String, dynamic> item in response.data) {
        items.add(Professional.fromJson(item));
      }
    } catch (e) {
      print(e);
    }

    return items;
  }
}
