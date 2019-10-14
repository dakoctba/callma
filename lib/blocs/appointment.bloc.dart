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
  var _appointmentRepository = new AppointmentRepository();

  //
  // Address
  //
  int _addressId;
  int get addressId => _addressId;
  void setAddress(addressId) => this._addressId = addressId;

  //
  // Cancelation Policy
  //
  bool _cancellationPolicy = false;
  bool get cancellationPolicy => _cancellationPolicy;
  void changeCancellationPolicy(value) => this._cancellationPolicy = value;

  //
  // Receipt
  //
  bool _receipt = false;
  bool get receipt => _receipt;
  void changeReceipt(value) => this._receipt = value;

  //
  // Date
  //
  DateTime _date = null;
  DateTime get date => _date;
  void setDate(date) => this._date = date;

  //
  // User
  //
  User _user = null;
  User get user => _user;

  //
  // Professional
  //
  Professional _professional = null;
  Professional get professional => _professional;
  void setProfessional(Professional professional) =>
      this._professional = professional;

  //
  // User
  //
  String _notes = "";
  String get notes => _notes;
  void changeNotes(notes) => this._notes = notes;

  //
  // Profile (dependent)
  //
  int _profileId;
  int get profileId => this._profileId;
  void setProfileId(profile) => this._profileId = profile;

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
    params['address_id'] = this._addressId;
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

    _reset();
  }

  void _reset() {
    this._addressId = null;
    this._cancellationPolicy = false;
    this._receipt = false;
    this._date = null;
    this._user = null;
    this._professional = null;
    this._notes = "";
    this._profileId = null;
  }

  void dispose() {
    super.dispose();
  }
}
