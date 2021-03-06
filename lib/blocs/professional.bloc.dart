import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:callma/models/professional.dart';
import 'package:callma/repositories/professional.repository.dart';
import 'package:rxdart/rxdart.dart';

class ProfessionalBloc extends BlocBase {
  var _professionalRepository = ProfessionalRepository();

  final BehaviorSubject<List<Professional>> _controller =
      BehaviorSubject<List<Professional>>();
  Stream<List<Professional>> get stream => _controller;

  List<Professional> get professionals => _controller.value;

  void getProfessionals(String sex, int specialtyId) async {
    List<Professional> response =
        await _professionalRepository.getProfessionals(sex, specialtyId);
    _controller.sink.add(response);
  }

  void dispose() {
    _controller.close();

    super.dispose();
  }
}
