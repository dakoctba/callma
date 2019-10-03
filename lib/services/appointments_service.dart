import 'dart:io';

import 'package:callma/models/appointment.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppointmentsService {
  static Future<List<Appointment>> getAppointments() async {
    List<Appointment> items = new List<Appointment>();

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
      Response response = await dio.get("${DotEnv().env['API_URL']}/api/users/1/appointments");

      for (Map<String, dynamic> item in response.data) {
        items.add(Appointment.fromJson(item));
      }
    } catch (e) {
      print(e);
    }

    return items;
  }
}
