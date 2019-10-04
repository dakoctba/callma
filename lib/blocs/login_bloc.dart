import 'package:callma/models/user.dart';
import 'package:callma/services/login_service.dart';
import 'package:rxdart/subjects.dart';

class LoginBloc {
  User _user;
  User get currentUser => _user;

  final _controller = new BehaviorSubject<User>();

  Stream<User> get result => _controller.stream;

  get() {
    return _user;
  }

  Future<void> login(String user, String password) async {
    try {
      _user = await LoginService.login(user, password);
      _controller.sink.add(_user);
    } catch (e) {
      throw e;
    }
  }

  dispose() {
    print("Chamou o dispose em ${this.runtimeType}");
    _controller.close();
  }
}
