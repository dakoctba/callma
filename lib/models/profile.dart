class Profile {
  int id;
  int userId;
  String name;
  String cpf;
  String photo;
  String phone;
  String birthDate;
  String sex;
  String status;
  String createdAt;

  Profile(
      {this.id,
      this.userId,
      this.name,
      this.cpf,
      this.photo,
      this.phone,
      this.birthDate,
      this.sex,
      this.status,
      this.createdAt});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    cpf = json['cpf'];
    photo = json['photo'];
    phone = json['phone'];
    birthDate = json['birth_date'];
    sex = json['sex'];
    status = json['status'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['cpf'] = this.cpf;
    data['photo'] = this.photo;
    data['phone'] = this.phone;
    data['birth_date'] = this.birthDate;
    data['sex'] = this.sex;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    return data;
  }
}
