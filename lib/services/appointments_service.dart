import 'dart:io';

import 'package:callma/models/appointment.dart';
import 'package:callma/services/auth_dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppointmentsService {
  static Future<List<Appointment>> getAppointments() async {
    List<Appointment> items = new List<Appointment>();

    try {
      Dio dio = await AuthDio.getDio();

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
