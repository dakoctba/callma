class Professional {
  int id;
  String name;
  String photo;
  String address;
  int stars;
  String price;

  Professional({this.id, this.name, this.photo, this.address, this.stars, this.price});

  Professional.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    photo = json['photo'];
    address = json['address'];
    stars = json['stars'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['photo'] = this.photo;
    data['address'] = this.address;
    data['stars'] = this.stars;
    data['price'] = this.price;
    return data;
  }
}
