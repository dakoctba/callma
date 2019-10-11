import 'package:rxdart/rxdart.dart';

import 'package:callma/models/specialty.dart';
import 'package:callma/services/specialties_service.dart';

class SpecialtiesController {
  List<Specialty> _specialties;
  List<Specialty> get specialties => _specialties;

  final BehaviorSubject<List<Specialty>> _controller = BehaviorSubject<List<Specialty>>();
  Stream<List<Specialty>> get stream => _controller.stream;

  void getSpecialties(int professionId) async {
    List<Specialty> response = await SpecialtiesService.getSpecialties(professionId);
    _controller.sink.add(response);
  }

  void dispose() {
    _controller.close();
  }
}
