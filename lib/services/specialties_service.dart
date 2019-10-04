import 'package:callma/models/specialty.dart';
import 'package:callma/services/auth_dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SpecialtiesService {
  static Future<List<Specialty>> getSpecialties(int professionId) async {
    List<Specialty> items = new List<Specialty>();

    try {
      Dio dio = await AuthDio.getDio();

      Response response = await dio.get("${DotEnv().env['API_URL']}/api/professions/$professionId/specialties");

      for (Map<String, dynamic> item in response.data) {
        items.add(Specialty.fromJson(item));
      }
    } catch (e) {
      print(e);
    }

    return items;
  }
}
