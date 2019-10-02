import 'package:rxdart/rxdart.dart';

import 'package:callma/models/profession.dart';
import 'package:callma/services/professions_service.dart';

class ProfessionsBloc {
  final BehaviorSubject<List<Profession>> _subject = BehaviorSubject<List<Profession>>();
  BehaviorSubject<List<Profession>> get subject => _subject;

  void getProfessions() async {
    List<Profession> response = await ProfessionsService.getProfessions();
    _subject.sink.add(response);
  }

  dispose() {
    print("Chamou o dispose em ${this.runtimeType}");
    _subject.close();
  }
}

final bloc = ProfessionsBloc();
