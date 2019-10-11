import 'package:callma/models/appointment.dart';
import 'package:callma/services/auth_dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert';

import 'package:logger/logger.dart';

class AppointmentsService {
  static Future<List<Appointment>> getAppointments(int userId) async {
    List<Appointment> items = new List<Appointment>();

    try {
      Dio dio = await AuthDio.getDio();

      Response response = await dio.get("${DotEnv().env['API_URL']}/api/users/$userId/appointments");

      for (Map<String, dynamic> item in response.data) {
        items.add(Appointment.fromJson(item));
      }
    } catch (e) {
      Logger().e(e);
    }

    return items;
  }

  static Future<void> save(Map<String, dynamic> params) async {
    try {
      Dio dio = await AuthDio.getDio();

      await dio.post("${DotEnv().env['API_URL']}/api/users/1/appointments", data: json.encode(params));
    } catch (e) {
      throw e;
    }
  }
}
