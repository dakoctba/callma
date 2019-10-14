import 'package:callma/models/appointment.dart';
import 'package:callma/repositories/auth_dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert';

import 'package:logger/logger.dart';

class AppointmentRepository {
  Future<List<Appointment>> getAppointments(int userId) async {
    Dio dio = await AuthDio.getDio();

    var url = "${DotEnv().env['API_URL']}/api/users/$userId/appointments";

    Response response = await dio.get(url);

    List<Appointment> appointments = (response.data as List)
        .map((appointment) => Appointment.fromJson(appointment))
        .toList();

    return appointments;
  }

  Future<void> save(Map<String, dynamic> params) async {
    try {
      Dio dio = await AuthDio.getDio();

      var url = "${DotEnv().env['API_URL']}/api/users/1/appointments";

      await dio.post(url, data: json.encode(params));
    } catch (e) {
      Logger().e(e);
      throw e;
    }
  }
}
