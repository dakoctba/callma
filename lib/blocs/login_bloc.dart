import 'package:rxdart/subjects.dart';

class LoginBloc {
  final _subject = new BehaviorSubject();

  login() {}

  dispose() {
    _subject.close();
  }
}
