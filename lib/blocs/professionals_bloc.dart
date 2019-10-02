import 'package:rxdart/rxdart.dart';

import 'package:callma/models/professional.dart';
import 'package:callma/services/professionals_service.dart';

class ProfessionalsBloc {
  final BehaviorSubject<List<Professional>> _subject = BehaviorSubject<List<Professional>>();
  BehaviorSubject<List<Professional>> get subject => _subject;

  void getProfessionals(int specialtyId) async {
    List<Professional> response = await ProfessionalsService.getProfessionals(specialtyId);
    _subject.sink.add(response);
  }

  dispose() {
    print("Chamou o dispose em ${this.runtimeType}");
    _subject.close();
  }
}

final bloc = ProfessionalsBloc();
