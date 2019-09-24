import 'package:rxdart/rxdart.dart';

import 'package:callma/models/profession.dart';
import 'package:callma/repositories/professions_repository.dart';

class ProfessionsBloc {
  final BehaviorSubject<List<Profession>> _subject = BehaviorSubject<List<Profession>>();
  BehaviorSubject<List<Profession>> get subject => _subject;

  void getProfessions() async {
    List<Profession> response = await ProfessionsRepository.getProfessions();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }
}

final bloc = ProfessionsBloc();
