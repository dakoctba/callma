import 'package:callma/enumerations/appointment_status.dart';
import 'package:callma/models/appointment.dart';
import 'package:callma/models/professional.dart';
import 'package:callma/models/user.dart';
import 'package:callma/services/appointments_service.dart';
import 'package:farm/helpers.dart';
import 'package:rxdart/rxdart.dart';

class AppointmentsController with DateHelper, EnumHelper {
  //
  // Appointments
  //
  List<Appointment> _appointments;
  List<Appointment> get appointments => _appointments;

  final _appointmentsController = BehaviorSubject<List<Appointment>>();
  Stream<List<Appointment>> get appointmentsStream => _appointmentsController.stream;

  void getAppointments() async {
    _appointments = await AppointmentsService.getAppointments();
    _appointmentsController.sink.add(_appointments);
  }

  //
  // User
  //
  User _user;
  User get user => _user;

  final _userController = BehaviorSubject<User>();
  Stream<User> get userStream => _userController.stream;

  setUser(User user) {
    _user = user;
    _userController.sink.add(user);
  }

  //
  // Professional
  //
  Professional _professional;
  Professional get professional => _professional;

  final _professionalController = BehaviorSubject<Professional>();
  Stream<Professional> get professionalStream => _professionalController.stream;

  setProfessional(Professional professional) {
    _professional = professional;
    _professionalController.sink.add(professional);
  }

  //
  // Date of appointment
  //
  DateTime _date;
  DateTime get date => _date;

  final _dateController = BehaviorSubject<DateTime>();
  Stream<DateTime> get dateStream => _dateController.stream;

  setDate(DateTime date) {
    _date = date;
    _dateController.sink.add(date);
  }

  //
  // Receipt
  //
  bool _receipt = false;
  bool get receipt => _receipt;

  final _receiptController = BehaviorSubject<bool>.seeded(false);
  Stream<bool> get receiptStream => _receiptController.stream;

  setReceipt(bool option) {
    _receipt = option;
    _receiptController.sink.add(option);
  }

  //
  // Notes
  //
  String _notes;
  String get notes => _notes;

  final _notesController = BehaviorSubject<String>();
  Stream<String> get notesStream => _notesController.stream;

  setNotes(String notes) {
    _notes = notes;
    _notesController.sink.add(notes);
  }

  //
  // Cancellation Policy
  //
  bool _cancellationPolicy = false;
  bool get cancellationPolicy => _cancellationPolicy;

  final _cancellationPolicyController = BehaviorSubject<bool>.seeded(false);
  Stream<bool> get cancellationPolicyStream => _cancellationPolicyController.stream;

  setCancellationPolicy(bool option) {
    _cancellationPolicy = option;
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

    print("Criando consulta com os parâmetros $params");

    await AppointmentsService.save(params);
  }

  dispose() {
    _appointmentsController.close();
    _cancellationPolicyController.close();
    _dateController.close();
    _notesController.close();
    _professionalController.close();
    _receiptController.close();
    _userController.close();
  }
}
