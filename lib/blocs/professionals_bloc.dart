import 'package:rxdart/rxdart.dart';

import 'package:callma/models/professional.dart';
import 'package:callma/services/professionals_service.dart';

class ProfessionalsBloc {
  List<Professional> _professionals;
  List<Professional> get professionals => _professionals;

  final BehaviorSubject<List<Professional>> _controller = BehaviorSubject<List<Professional>>();
  Stream<List<Professional>> get data => _controller;

  void getProfessionals(int specialtyId) async {
    List<Professional> response = await ProfessionalsService.getProfessionals(specialtyId);
    _controller.sink.add(response);
  }

  dispose() {
    print("Chamou o dispose em ${this.runtimeType}");
    _controller.close();
  }
}
