import 'package:rxdart/rxdart.dart';

import 'package:callma/models/appointment.dart';
import 'package:callma/services/appointments_service.dart';

class AppointmentsBloc {
  final BehaviorSubject<List<Appointment>> _subject = BehaviorSubject<List<Appointment>>();
  BehaviorSubject<List<Appointment>> get subject => _subject;

  void getAppointments() async {
    List<Appointment> response = await AppointmentsService.getAppointments();
    _subject.sink.add(response);
  }

  dispose() {
    print("Chamou o dispose em ${this.runtimeType}");
    _subject.close();
  }
}

final bloc = AppointmentsBloc();
