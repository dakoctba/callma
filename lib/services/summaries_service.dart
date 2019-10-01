import 'dart:io';

import 'package:callma/models/summary.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SummariesService {
  static Future<Summary> getSummaries(int professionalId) async {
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
      Response response =
          await dio.get("http://callma-api.herokuapp.com/api/professionals/$professionalId/reviews/summary");

      Summary summary = Summary.fromJson(response.data);
      return summary;
    } catch (e) {
      print(e);
    }

    return null;
  }
}
