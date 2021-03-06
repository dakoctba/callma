import 'package:callma/models/specialty.dart';
import 'package:callma/repositories/auth_dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';

class SpecialtyRepository {
  Future<List<Specialty>> getSpecialties(int professionId) async {
    var items = new List<Specialty>();

    try {
      Dio dio = await AuthDio.getDio();

      Response response = await dio.get(
          "${DotEnv().env['API_URL']}/api/professions/$professionId/specialties");

      for (Map<String, dynamic> item in response.data) {
        items.add(Specialty.fromJson(item));
      }
    } catch (e) {
      Logger().e(e);
    }

    return items;
  }
}
