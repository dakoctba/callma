import 'package:callma/models/profession.dart';
import 'package:callma/services/auth_dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';

class ProfessionsService {
  static Future<List<Profession>> getProfessions() async {
    var items = new List<Profession>();

    try {
      Dio dio = await AuthDio.getDio();

      Response response = await dio.get("${DotEnv().env['API_URL']}/api/professions");

      for (Map<String, dynamic> item in response.data) {
        items.add(Profession.fromJson(item));
      }
    } catch (e) {
      Logger().e(e);
    }

    return items;
  }
}
