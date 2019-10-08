import 'package:farm/helpers.dart';

import 'package:callma/models/address.dart';
import 'package:callma/models/clinic.dart';
import 'package:callma/models/professional.dart';

class Appointment with DateHelper {
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
  Clinic clinic;
  Address address;
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
      this.clinic,
      this.address,
      this.professional});

  Appointment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    professionalId = json['professional_id'];
    profileId = json['profile_id'];
    schedule = buildDate(json['schedule']);
    paymentStatus = json['payment_status'];
    notes = json['notes'];
    receipt = json['receipt'];
    price = json['price'];
    status = json['status'];
    createdAt = json['created_at'];
    clinic = json['clinic'] != null ? new Clinic.fromJson(json['clinic']) : null;
    address = json['address'] != null ? new Address.fromJson(json['address']) : null;
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
    if (this.clinic != null) {
      data['clinic'] = this.clinic.toJson();
    }
    if (this.address != null) {
      data['address'] = this.address.toJson();
    }
    if (this.professional != null) {
      data['professional'] = this.professional.toJson();
    }
    return data;
  }
}
