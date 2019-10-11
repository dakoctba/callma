import 'package:callma/exceptions/callma_exception.dart';
import 'package:callma/models/user.dart';
import 'package:callma/services/auth_dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:callma/models/login.dart';

class UsersService {
  static Future<User> login(String user, String password) async {
    Login login = Login(user, password);

    try {
      Response response = await Dio().post("${DotEnv().env['API_URL']}/login", data: login.toJson());

      String token = response.headers.value("authorization").replaceAll('Bearer ', '');

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("token", token);

      //
      // Se passou do login, busca os dados do usuário
      //
      User result = await UsersService._getUser(response.data['id']);

      if (result != null && result.userType == 'professional') {
        throw CallmaException("Para o seu perfil de usuário, favor utilizar o aplicativo 'Callma Professional'");
      }

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

        throw new CallmaException(e.response.data["error"]);
      } else {
        //
        // Something happened in setting up or sending the request that triggered an Error
        //
        Logger().e(e.request);
        Logger().e(e.message);

        throw new CallmaException(e.message);
      }
    }
  }

  static Future<User> _getUser(dynamic userId) async {
    try {
      Dio dio = await AuthDio.getDio();

      Response response = await dio.get("${DotEnv().env['API_URL']}/api/users/$userId");

      User result = User.fromJson(response.data);
      return result;
    } catch (e) {
      Logger().e(e);
    }

    return null;
  }
}
