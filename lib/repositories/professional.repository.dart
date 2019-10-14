import 'package:callma/models/professional.dart';
import 'package:callma/repositories/auth_dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';

class ProfessionalRepository {
  Future<List<Professional>> getProfessionals(
      String sex, int specialtyId) async {
    List<Professional> items = new List<Professional>();

    try {
      Dio dio = await AuthDio.getDio();

      Response response = await dio.get(
          "${DotEnv().env['API_URL']}/api/professionals/by_specialty/$specialtyId?sex=$sex");

      for (Map<String, dynamic> item in response.data) {
        items.add(Professional.fromJson(item));
      }
    } catch (e) {
      Logger().e(e);
    }

    return items;
  }

  Future<Professional> getProfessional(int id) async {
    try {
      Dio dio = await AuthDio.getDio();

      Response response =
          await dio.get("${DotEnv().env['API_URL']}/api/professionals/$id");

      Professional result = Professional.fromJson(response.data);
      return result;
    } catch (e) {
      Logger().e(e);
    }

    return null;
  }
}
