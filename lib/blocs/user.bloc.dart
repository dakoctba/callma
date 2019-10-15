import 'dart:convert';

import 'package:callma/models/user.dart';
import 'package:callma/repositories/user.repository.dart';
import 'package:callma/settings.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserBloc extends ChangeNotifier {
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

  // Future<UserModel> create(CreateUserModel model) async {
  //   try {
  //     var repository = new AccountRepository();
  //     var res = await repository.create(model);
  //     return res;
  //   } catch (ex) {
  //     print(ex);
  //     user = null;
  //     return null;
  //   }
  // }

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

  // var _userRepository = UserRepository();

  // final _controller = new BehaviorSubject<User>();
  // Stream<User> get stream => _controller.stream;

  // Future<User> login(String email, String password) async {
  //   try {
  //     User user = await _userRepository.login(email, password);
  //     _controller.sink.add(user);

  //     return user;
  //   } catch (e) {
  //     throw e;
  //   }
  // }

  // void dispose() {
  //   _controller.close();
  // }
}
