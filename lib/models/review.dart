import 'package:callma/models/user.dart';

class Review {
  int id;
  double stars;
  String description;
  String createdAt;
  User user;

  Review({this.id, this.stars, this.description, this.createdAt, this.user});

  Review.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stars = json['stars'].toDouble();
    description = json['description'];
    createdAt = json['created_at'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['stars'] = this.stars;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}
