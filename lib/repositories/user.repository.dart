import 'dart:convert';

import 'package:callma/models/address.dart';
import 'package:callma/models/user.dart';
import 'package:callma/repositories/auth_dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  Future<User> login(String email, String password) async {
    var login = {
      "user": {"email": email, "password": password}
    };

    try {
      Response response = await Dio()
          .post("${DotEnv().env['API_URL']}/login", data: jsonEncode(login));

      String token =
          response.headers.value("authorization").replaceAll('Bearer ', '');

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("token", token);

      //
      // Se passou do login, busca os dados do usuário
      //
      User result = await _getUser(response.data['id']);
      return result;
    } on DioError catch (e) {
      //
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      //
      if (e.response != null) {
        Logger().e(e.response.statusCode);
        Logger().e(e.response.data);
        Logger().e(e.response.headers);
        Logger().e(e.response.request);

        throw new Exception(e.response.data["error"]);
      } else {
        //
        // Something happened in setting up or sending the request that triggered an Error
        //
        Logger().e(e.request);
        Logger().e(e.message);

        throw new Exception(e.message);
      }
    }
  }

  Future<User> _getUser(int userId) async {
    Dio dio = await AuthDio.getDio();

    Response response =
        await dio.get("${DotEnv().env['API_URL']}/api/users/$userId");

    User result = User.fromJson(response.data);
    return result;
  }

  Future<List<Address>> getAddresses(int userId) async {
    Dio dio = await AuthDio.getDio();

    Response response =
        await dio.get("${DotEnv().env['API_URL']}/api/users/$userId/addresses");

    List<Address> result = (response.data as List)
        .map((address) => Address.fromJson(address))
        .toList();

    return result;
  }
}
