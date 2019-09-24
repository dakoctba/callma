import 'package:callma/exceptions/callma_exception.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:callma/models/login.dart';
import 'package:callma/models/user.dart';

class LoginRepository {
  static login() async {
    User user = new User();
    user.email = "jackson@setbox.com.br";
    user.password = "12345678";

    Login login = Login();
    login.user = user;

    try {
      Response response = await Dio().post("http://callma-api.herokuapp.com/login", data: login.toJson());

      String token = response.headers.value("authorization").replaceAll('Bearer ', '');

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("token", token);

      print("Vai persistir o token $token");
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
