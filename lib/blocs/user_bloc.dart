import 'package:callma/models/user.dart';
import 'package:callma/services/user_service.dart';
import 'package:rxdart/subjects.dart';

class UserBloc {
  // User _user;
  // User get currentUser => _user;

  final _controller = new BehaviorSubject<User>();
  Stream<User> get result => _controller.stream;

  Future<User> login(String email, String password) async {
    try {
      User user = await UserService.login(email, password);
      _controller.sink.add(user);

      return user;
    } catch (e) {
      throw e;
    }
  }

  dispose() {
    print("Chamou o dispose em ${this.runtimeType}");
    _controller.close();
  }
}
