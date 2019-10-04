import 'package:rxdart/rxdart.dart';

import 'package:callma/models/appointment.dart';
import 'package:callma/services/appointments_service.dart';

class AppointmentsBloc {
  List<Appointment> _appointments;
  List<Appointment> get appointments => _appointments;

  final _controller = BehaviorSubject<List<Appointment>>();
  Stream<List<Appointment>> get data => _controller.stream;

  void getAppointments() async {
    List<Appointment> response = await AppointmentsService.getAppointments();
    _controller.sink.add(response);
  }

  dispose() {
    print("Chamou o dispose em ${this.runtimeType}");
    _controller.close();
  }
}
