import 'package:rxdart/rxdart.dart';

import 'package:callma/models/professional.dart';
import 'package:callma/services/professionals_service.dart';

class ProfessionalsController {
  final BehaviorSubject<List<Professional>> _controller = BehaviorSubject<List<Professional>>();
  Stream<List<Professional>> get stream => _controller;

  List<Professional> get professionals => _controller.value;

  void getProfessionals(String sex, int specialtyId) async {
    List<Professional> response = await ProfessionalsService.getProfessionals(sex, specialtyId);
    _controller.sink.add(response);
  }

  void dispose() {
    _controller.close();
  }
}
