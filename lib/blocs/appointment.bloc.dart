import 'package:callma/enumerations/appointment_status.dart';
import 'package:callma/models/appointment.dart';
import 'package:callma/models/professional.dart';
import 'package:callma/models/user.dart';
import 'package:callma/repositories/appointments.repository.dart';
import 'package:farm/helpers.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/rxdart.dart';

class AppointmentBloc extends ChangeNotifier with DateHelper, EnumHelper {
  User user = null;
  Professional professional = null;
  int profileId;

  bool _cancellationPolicy = false;
  bool get cancellationPolicy => _cancellationPolicy;
  void changeCancellationPolicy(bool value) => this._cancellationPolicy = value;

  String _notes = "";
  String get notes => _notes;
  void changeNotes(String notes) => this._notes = notes;

  bool _receipt = false;
  bool get receipt => _receipt;
  void changeReceipt(bool value) => this._receipt = value;

  DateTime _date = null;
  DateTime get date => _date;
  void setDate(DateTime date) => this._date = date;

  var _appointmentRepository = new AppointmentRepository();

  //
  // Appointments
  //
  final _appointmentsBloc = BehaviorSubject<List<Appointment>>();
  Stream<List<Appointment>> get appointmentsStream => _appointmentsBloc.stream;

  List<Appointment> get appointments => _appointmentsBloc.value;

  void getAppointments(int userId) async {
    List<Appointment> appointments =
        await _appointmentRepository.getAppointments(userId);
    _appointmentsBloc.sink.add(appointments);
  }

  //
  // Save appointment
  //
  Future<void> save() async {
    var params = new Map<String, dynamic>();
    // params['address_id'] = this.user.addresses[0].id;
    params['clinic_id'] = this.professional.clinics[0].id;
    params['notes'] = this._notes;
    params['payment_status'] = 'confirmed';
    params['price'] = this.professional.price;
    params['professional_id'] = this.professional.id;
    params['profile_id'] = this.profileId;
    params['receipt'] = this._receipt;
    params['schedule'] = formatDateToBd(this._date);
    params['status'] = enumToString(AppointmentStatus.scheduled);

    Logger().d("Vai salvar a consulta com os seguintes parâmetros $params");

    await _appointmentRepository.save(params);
  }

  void dispose() {
    super.dispose();
  }
}
