import 'package:rxdart/subjects.dart';

class LoginBloc {
  final _subject = new BehaviorSubject();

  login() {}

  dispose() {
    print("Chamou o dispose em ${this.runtimeType}");
    _subject.close();
  }
}
