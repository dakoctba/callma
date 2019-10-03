import 'package:callma/helpers/application_helper.dart';
import 'package:callma/models/professional.dart';

class Appointment {
  int id;
  int professionalId;
  int profileId;
  DateTime schedule;
  String paymentStatus;
  String notes;
  bool receipt;
  double price;
  String status;
  String createdAt;
  Professional professional;

  Appointment(
      {this.id,
      this.professionalId,
      this.profileId,
      this.schedule,
      this.paymentStatus,
      this.notes,
      this.receipt,
      this.price,
      this.status,
      this.createdAt,
      this.professional});

  Appointment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    professionalId = json['professional_id'];
    profileId = json['profile_id'];
    schedule = ApplicationHelper.buildDate(json['schedule']);
    paymentStatus = json['payment_status'];
    notes = json['notes'];
    receipt = json['receipt'];
    price = json['price'];
    status = json['status'];
    createdAt = json['created_at'];
    professional = json['professional'] != null ? new Professional.fromJson(json['professional']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['professional_id'] = this.professionalId;
    data['profile_id'] = this.profileId;
    data['schedule'] = this.schedule;
    data['payment_status'] = this.paymentStatus;
    data['notes'] = this.notes;
    data['receipt'] = this.receipt;
    data['price'] = this.price;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    if (this.professional != null) {
      data['professional'] = this.professional.toJson();
    }
    return data;
  }
}