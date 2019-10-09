import 'package:callma/models/summary.dart';
import 'package:callma/services/auth_dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SummariesService {
  static Future<Summary> getSummary(int professionalId) async {
    try {
      Dio dio = await AuthDio.getDio();

      Response response = await dio.get("${DotEnv().env['API_URL']}/api/professionals/$professionalId/reviews/summary");

      Summary summary = Summary.fromJson(response.data);
      return summary;
    } catch (e) {
      print(e);
    }

    return null;
  }
}
