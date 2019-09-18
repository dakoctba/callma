import 'package:callma/models/profession.dart';
import 'package:dio/dio.dart';

class ProfessionsRepository {
  static Future<List<Profession>> getProfessions() async {
    List<Profession> items = new List<Profession>();

    try {
      Response response = await Dio().get("https://callma-api.herokuapp.com/api/professions");

      for (Map<String, dynamic> item in response.data) {
        items.add(Profession.fromJson(item));
      }
    } catch (e) {
      print(e);
    }

    return items;
  }
}
