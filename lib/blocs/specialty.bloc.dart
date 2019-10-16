import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:callma/models/specialty.dart';
import 'package:callma/repositories/specialty.repository.dart';
import 'package:rxdart/rxdart.dart';

class SpecialtyBloc extends BlocBase {
  var _specialtyRepository = SpecialtyRepository();

  List<Specialty> _specialties;
  List<Specialty> get specialties => _specialties;

  final BehaviorSubject<List<Specialty>> _controller =
      BehaviorSubject<List<Specialty>>();
  Stream<List<Specialty>> get stream => _controller.stream;

  void getSpecialties(int professionId) async {
    List<Specialty> response =
        await _specialtyRepository.getSpecialties(professionId);
    _controller.sink.add(response);
  }

  void dispose() {
    _controller.close();

    super.dispose();
  }
}
