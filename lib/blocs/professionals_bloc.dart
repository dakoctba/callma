import 'package:rxdart/rxdart.dart';

import 'package:callma/models/professional.dart';
import 'package:callma/repositories/professionals_repository.dart';

class ProfessionalsBloc {
  final BehaviorSubject<List<Professional>> _subject = BehaviorSubject<List<Professional>>();
  BehaviorSubject<List<Professional>> get subject => _subject;

  void getProfessionals(int specialtyId) async {
    List<Professional> response = await ProfessionalsRepository.getProfessionals(specialtyId);
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }
}

final bloc = ProfessionalsBloc();
