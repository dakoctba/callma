import 'package:callma/models/review.dart';
import 'package:callma/repositories/auth_dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';

class ReviewRepository {
  Future<List<Review>> getReviews(int professionalId) async {
    var items = new List<Review>();

    try {
      Dio dio = await AuthDio.getDio();

      Response response = await dio.get(
          "${DotEnv().env['API_URL']}/api/professionals/$professionalId/reviews");

      for (Map<String, dynamic> item in response.data) {
        items.add(Review.fromJson(item));
      }
    } catch (e) {
      Logger().e(e);
    }

    return items;
  }
}
