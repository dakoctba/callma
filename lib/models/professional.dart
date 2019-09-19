import 'package:callma/models/profession.dart';

class Professional {
  int id;
  String name;
  String photo;
  String address;
  int stars;
  String professionalClassBoardId;
  double price;
  int atendimentos;
  int dias;
  Profession profession;

  Professional(
      {this.id,
      this.name,
      this.photo,
      this.address,
      this.stars,
      this.professionalClassBoardId,
      this.price,
      this.atendimentos,
      this.dias,
      this.profession});

  Professional.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    photo = json['photo'];
    address = json['address'];
    stars = json['stars'];
    professionalClassBoardId = json['professional_class_board_id'];
    price = json['price'];
    atendimentos = json['atendimentos'];
    dias = json['dias'];
    profession = json['profession'] != null ? new Profession.fromJson(json['profession']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['photo'] = this.photo;
    data['address'] = this.address;
    data['stars'] = this.stars;
    data['professional_class_board_id'] = this.professionalClassBoardId;
    data['price'] = this.price;
    data['atendimentos'] = this.atendimentos;
    data['dias'] = this.dias;
    if (this.profession != null) {
      data['profession'] = this.profession.toJson();
    }
    return data;
  }
}
