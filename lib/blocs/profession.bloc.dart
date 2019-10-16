import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:callma/models/profession.dart';
import 'package:callma/repositories/profession.repository.dart';
import 'package:rxdart/rxdart.dart';

class ProfessionBloc extends BlocBase {
  var _professionRepository = ProfessionRepository();

  List<Profession> professions;

  final _controller = BehaviorSubject<List<Profession>>();
  Stream<List<Profession>> get stream => _controller.stream;

  void getProfessions() async {
    List<Profession> response = await _professionRepository.getProfessions();
    _controller.sink.add(response);
  }

  void dispose() {
    _controller.close();

    super.dispose();
  }
}
