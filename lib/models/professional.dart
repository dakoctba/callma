import 'package:callma/models/clinic.dart';
import 'package:callma/models/profession.dart';
import 'package:callma/models/specialty.dart';

class Professional {
  int id;
  String name;
  String photo;
  double stars;
  String professionalClassBoardId;
  double price;
  int atendimentos;
  int dias;
  Profession profession;
  List<Specialty> specialties;
  List<Clinic> clinics;

  Professional(
      {this.id,
      this.name,
      this.photo,
      this.stars,
      this.professionalClassBoardId,
      this.price,
      this.atendimentos,
      this.dias,
      this.profession,
      List<Specialty> specialties,
      this.clinics});

  Professional.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    photo = json['photo'];
    stars = json['stars'];
    professionalClassBoardId = json['professional_class_board_id'];
    price = json['price'];
    atendimentos = json['atendimentos'];
    dias = json['dias'];
    profession = json['profession'] != null ? new Profession.fromJson(json['profession']) : null;
    if (json['specialties'] != null) {
      specialties = new List<Specialty>();
      json['specialties'].forEach((v) {
        specialties.add(new Specialty.fromJson(v));
      });
    }
    if (json['clinics'] != null) {
      clinics = new List<Clinic>();
      json['clinics'].forEach((v) {
        clinics.add(new Clinic.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['photo'] = this.photo;
    data['stars'] = this.stars;
    data['professional_class_board_id'] = this.professionalClassBoardId;
    data['price'] = this.price;
    data['atendimentos'] = this.atendimentos;
    data['dias'] = this.dias;
    if (this.profession != null) {
      data['profession'] = this.profession.toJson();
    }
    if (this.specialties != null) {
      data['specialties'] = this.specialties.map((v) => v.toJson()).toList();
    }
    if (this.clinics != null) {
      data['clinics'] = this.clinics.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
