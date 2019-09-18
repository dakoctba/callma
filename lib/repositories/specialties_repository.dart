import 'package:callma/models/specialty.dart';
import 'package:dio/dio.dart';

class SpecialtiesRepository {
  static Future<List<Specialty>> getSpecialties(int professionId) async {
    List<Specialty> items = new List<Specialty>();

    try {
      Response response = await Dio().get("https://callma-api.herokuapp.com/api/professions/$professionId/specialties");

      for (Map<String, dynamic> item in response.data) {
        items.add(Specialty.fromJson(item));
      }
    } catch (e) {
      print(e);
    }
    return items;
  }
}
