import 'dart:io';

import 'package:callma/models/review.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReviewsService {
  static Future<List<Review>> getReviews(int professionalId) async {
    List<Review> items = new List<Review>();

    try {
      //
      // Token
      //
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = await prefs.get("token");

      //
      // Request
      //
      Dio dio = new Dio();
      dio.options.headers = {'Authorization': 'Bearer ' + token};
      dio.options.contentType = ContentType.parse("application/json");

      //
      // Response
      //
      Response response = await dio.get("http://callma-api.herokuapp.com/api/professionals/$professionalId/reviews");

      for (Map<String, dynamic> item in response.data) {
        items.add(Review.fromJson(item));
      }
    } catch (e) {
      print(e);
    }

    return items;
  }
}
