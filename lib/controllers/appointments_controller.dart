import 'package:rxdart/rxdart.dart';

import 'package:callma/models/appointment.dart';
import 'package:callma/services/appointments_service.dart';

class AppointmentsController {
  List<Appointment> _appointments;
  List<Appointment> get appointments => _appointments;

  final _controller = BehaviorSubject<List<Appointment>>();
  Stream<List<Appointment>> get stream => _controller.stream;

  void getAppointments() async {
    List<Appointment> response = await AppointmentsService.getAppointments();
    _controller.sink.add(response);
  }

  Future<void> save(Map<String, dynamic> params) async {
    await AppointmentsService.save(params);
  }

  dispose() {
    print("Chamou o dispose em ${this.runtimeType}");
    _controller.close();
  }
}
