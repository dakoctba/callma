import 'package:callma/exceptions/callma_exception.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:callma/models/login.dart';

class LoginService {
  static login() async {
    Login login = Login("jackson@setbox.com.br", "12345678");

    print("Vai usar a variável API_URL = ${DotEnv().env['API_URL']}");

    try {
      Response response = await Dio().post("${DotEnv().env['API_URL']}/login", data: login.toJson());

      String token = response.headers.value("authorization").replaceAll('Bearer ', '');

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("token", token);
    } on DioError catch (e) {
      //
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      //
      if (e.response != null) {
        // print(e.response.statusCode);
        // print(e.response.data);
        // print(e.response.headers);
        // print(e.response.request);

        throw new CallmaException(e.response.data["error"]);
      } else {
        //
        // Something happened in setting up or sending the request that triggered an Error
        //
        // print(e.request);
        // print(e.message);

        throw new CallmaException(e.message);
      }
    }
  }
}
