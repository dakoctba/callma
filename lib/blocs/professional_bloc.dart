import 'package:rxdart/rxdart.dart';

import 'package:callma/models/professional.dart';
import 'package:callma/repositories/professionals_repository.dart';

class ProfessionalsBloc {
  final BehaviorSubject<Professional> _subject = BehaviorSubject<Professional>();
  BehaviorSubject<Professional> get subject => _subject;

  void getProfessionals(int id) async {
    Professional response = await ProfessionalsRepository.getProfessional(id);
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }
}

final bloc = ProfessionalsBloc();
