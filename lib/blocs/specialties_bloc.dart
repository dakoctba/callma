import 'package:rxdart/rxdart.dart';

import 'package:callma/models/specialty.dart';
import 'package:callma/repositories/specialties_repository.dart';

class SpecialtiesBloc {
  final BehaviorSubject<List<Specialty>> _subject = BehaviorSubject<List<Specialty>>();
  BehaviorSubject<List<Specialty>> get subject => _subject;

  void getSpecialties(int professionId) async {
    List<Specialty> response = await SpecialtiesRepository.getSpecialties(professionId);
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }
}

final bloc = SpecialtiesBloc();
