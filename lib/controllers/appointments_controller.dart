import 'package:callma/enumerations/appointment_status.dart';
import 'package:callma/models/appointment.dart';
import 'package:callma/models/professional.dart';
import 'package:callma/models/user.dart';
import 'package:callma/services/appointments_service.dart';
import 'package:farm/helpers.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/rxdart.dart';

class AppointmentsController with DateHelper, EnumHelper {
  //
  // Appointments
  //
  final _appointmentsController = BehaviorSubject<List<Appointment>>();
  Stream<List<Appointment>> get appointmentsStream => _appointmentsController.stream;

  List<Appointment> get appointments => _appointmentsController.value;

  void getAppointments(int userId) async {
    List<Appointment> appointments = await AppointmentsService.getAppointments(userId);
    _appointmentsController.sink.add(appointments);
  }

  //
  // User
  //
  final _userController = BehaviorSubject<User>();
  Stream<User> get userStream => _userController.stream;

  User get user => _userController.value;

  void setUser(User user) {
    _userController.sink.add(user);
  }

  //
  // Professional
  //
  final _professionalController = BehaviorSubject<Professional>();
  Stream<Professional> get professionalStream => _professionalController.stream;

  Professional get professional => _professionalController.value;

  void setProfessional(Professional professional) {
    _professionalController.sink.add(professional);
  }

  //
  // Date of appointment
  //
  final _dateController = BehaviorSubject<DateTime>();
  Stream<DateTime> get dateStream => _dateController.stream;

  DateTime get date => _dateController.value;

  void setDate(DateTime date) {
    _dateController.sink.add(date);
  }

  //
  // Receipt
  //
  final _receiptController = BehaviorSubject<bool>.seeded(false);
  Stream<bool> get receiptStream => _receiptController.stream;

  bool get receipt => _receiptController.value;

  void setReceipt(bool option) {
    _receiptController.sink.add(option);
  }

  //
  // Notes
  //
  final _notesController = BehaviorSubject<String>();
  Stream<String> get notesStream => _notesController.stream;

  String get notes => _notesController.value;

  void setNotes(String notes) {
    _notesController.sink.add(notes);
  }

  //
  // Cancellation Policy
  //
  final _cancellationPolicyController = BehaviorSubject<bool>.seeded(false);
  Stream<bool> get cancellationPolicyStream => _cancellationPolicyController.stream;

  bool get cancellationPolicy => _cancellationPolicyController.value;

  void setCancellationPolicy(bool option) {
    _cancellationPolicyController.sink.add(option);
  }

  //
  // Save appointment
  //
  Future<void> save() async {
    var params = new Map<String, dynamic>();
    params['professional_id'] = this.professional.id;
    params['profile_id'] = this.user.profiles[0].id;
    params['payment_status'] = 'confirmed';
    params['status'] = enumToString(AppointmentStatus.scheduled);
    params['schedule'] = formatDateToBd(this.date);
    params['address_id'] = this.user.addresses[0].id;
    params['price'] = this.professional.price;
    params['clinic_id'] = this.professional.clinics[0].id;
    params['receipt'] = this.receipt;
    params['notes'] = this.notes;

    Logger().d(params);

    await AppointmentsService.save(params);
  }

  void dispose() {
    _appointmentsController.close();
    _cancellationPolicyController.close();
    _dateController.close();
    _notesController.close();
    _professionalController.close();
    _receiptController.close();
    _userController.close();
  }
}
