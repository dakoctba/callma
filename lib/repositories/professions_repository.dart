import 'dart:io';

import 'package:callma/models/profession.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfessionsRepository {
  static Future<List<Profession>> getProfessions() async {
    List<Profession> items = new List<Profession>();

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
      Response response = await dio.get("https://callma-api.herokuapp.com/api/professions");

      for (Map<String, dynamic> item in response.data) {
        items.add(Profession.fromJson(item));
      }
    } catch (e) {
      print(e);
    }

    return items;
  }
}
