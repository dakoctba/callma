import 'package:callma/models/profession.dart';
import 'package:callma/repositories/auth_dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ProfessionRepository {
  Future<List<Profession>> getProfessions() async {
    Dio dio = await AuthDio.getDio();

    var url = "${DotEnv().env['API_URL']}/api/professions";

    Response response = await dio.get(url);

    return (response.data as List)
        .map((profession) => Profession.fromJson(profession))
        .toList();
  }
}
