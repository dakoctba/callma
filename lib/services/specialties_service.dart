import 'dart:io';

import 'package:callma/models/specialty.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpecialtiesService {
  static Future<List<Specialty>> getSpecialties(int professionId) async {
    List<Specialty> items = new List<Specialty>();

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
      Response response = await dio.get("https://callma-api.herokuapp.com/api/professions/$professionId/specialties");

      for (Map<String, dynamic> item in response.data) {
        items.add(Specialty.fromJson(item));
      }
    } catch (e) {
      print(e);
    }

    return items;
  }
}
