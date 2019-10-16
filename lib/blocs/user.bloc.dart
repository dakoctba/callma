import 'dart:convert';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:callma/models/user.dart';
import 'package:callma/repositories/user.repository.dart';
import 'package:callma/settings.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserBloc extends BlocBase {
  var user = User();

  UserBloc() {
    user = null;
    loadUser();
  }

  Future<User> login(String email, String password) async {
    try {
      var prefs = await SharedPreferences.getInstance();
      var repository = new UserRepository();

      user = await repository.login(email, password);

      await prefs.setString('user', jsonEncode(user));

      return user;
    } catch (e) {
      Logger().e(e);
      user = null;
      throw e;
    }
  }

  void logout() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', null);
    user = null;
    notifyListeners();
  }

  Future loadUser() async {
    var prefs = await SharedPreferences.getInstance();
    var userData = prefs.getString('user');
    if (userData != null) {
      var res = User.fromJson(jsonDecode(userData));
      Settings.user = res;
      user = res;
    }
  }
}
