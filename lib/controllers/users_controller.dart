import 'package:callma/models/user.dart';
import 'package:callma/services/users_service.dart';
import 'package:rxdart/subjects.dart';

class UsersController {
  final _controller = new BehaviorSubject<User>();
  Stream<User> get stream => _controller.stream;

  Future<User> login(String email, String password) async {
    try {
      User user = await UsersService.login(email, password);
      _controller.sink.add(user);

      return user;
    } catch (e) {
      throw e;
    }
  }

  void dispose() {
    _controller.close();
  }
}
