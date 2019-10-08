import 'package:rxdart/rxdart.dart';

import 'package:callma/models/profession.dart';
import 'package:callma/services/professions_service.dart';

class ProfessionsController {
  List<Profession> professions;

  final _controller = BehaviorSubject<List<Profession>>();
  Stream<List<Profession>> get stream => _controller.stream;

  void getProfessions() async {
    List<Profession> response = await ProfessionsService.getProfessions();
    _controller.sink.add(response);
  }

  dispose() {
    print("Chamou o dispose em ${this.runtimeType}");
    _controller.close();
  }
}
