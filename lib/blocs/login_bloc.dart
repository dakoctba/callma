import 'package:callma/models/user.dart';
import 'package:callma/services/login_service.dart';
import 'package:rxdart/subjects.dart';

class LoginBloc {
  User _user;
  User get loggedUser => _user;

  // 1
  final _controller = new BehaviorSubject<User>();

  // 2
  Stream<User> get saida => _controller.stream;

  void login(String user, String password) async {
    _user = await LoginService.login(user, password);
    _controller.sink.add(_user);
  }

  dispose() {
    print("Chamou o dispose em ${this.runtimeType}");
    _controller.close();
  }
}
