import 'package:callma/models/professional.dart';
import 'package:dio/dio.dart';

class ProfessionalsRepository {
  static Future<List<Professional>> getProfessionals(int professionId) async {
    List<Professional> items = new List<Professional>();

    try {
      Response response = await Dio().get("https://callma-api.herokuapp.com/api/professionals");

      for (Map<String, dynamic> item in response.data) {
        items.add(Professional.fromJson(item));
      }
    } catch (e) {
      print(e);
    }

    return items;
  }
}
