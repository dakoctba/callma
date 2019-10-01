class Address {
  int id;
  int userId;
  String address;
  String complement;
  String district;
  String city;
  String state;
  String zipcode;
  String createdAt;

  Address(
      {this.id,
      this.userId,
      this.address,
      this.complement,
      this.district,
      this.city,
      this.state,
      this.zipcode,
      this.createdAt});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    address = json['address'];
    complement = json['complement'];
    district = json['district'];
    city = json['city'];
    state = json['state'];
    zipcode = json['zipcode'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['address'] = this.address;
    data['complement'] = this.complement;
    data['district'] = this.district;
    data['city'] = this.city;
    data['state'] = this.state;
    data['zipcode'] = this.zipcode;
    data['created_at'] = this.createdAt;
    return data;
  }
}
