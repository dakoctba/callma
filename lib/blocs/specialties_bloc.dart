import 'package:rxdart/rxdart.dart';

import 'package:callma/models/specialty.dart';
import 'package:callma/services/specialties_service.dart';

class SpecialtiesBloc {
  final BehaviorSubject<List<Specialty>> _subject = BehaviorSubject<List<Specialty>>();
  BehaviorSubject<List<Specialty>> get subject => _subject;

  void getSpecialties(int professionId) async {
    List<Specialty> response = await SpecialtiesService.getSpecialties(professionId);
    _subject.sink.add(response);
  }

  dispose() {
    print("Chamou o dispose em ${this.runtimeType}");
    _subject.close();
  }
}

final bloc = SpecialtiesBloc();
