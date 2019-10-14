import 'package:callma/models/summary.dart';
import 'package:callma/repositories/auth_dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';

class SummaryRepository {
  Future<Summary> getSummary(int professionalId) async {
    try {
      Dio dio = await AuthDio.getDio();

      Response response = await dio.get(
          "${DotEnv().env['API_URL']}/api/professionals/$professionalId/reviews/summary");

      Summary summary = Summary.fromJson(response.data);
      return summary;
    } catch (e) {
      Logger().e(e);
    }

    return null;
  }
}
