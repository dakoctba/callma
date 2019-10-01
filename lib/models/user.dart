import 'package:callma/models/address.dart';
import 'package:callma/models/profile.dart';

class User {
  int id;
  String email;
  String password;
  String createdAt;
  List<Profile> profiles;
  List<Address> addresses;

  User({this.id, this.email, this.createdAt, this.profiles, this.addresses});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    createdAt = json['created_at'];
    if (json['profiles'] != null) {
      profiles = new List<Profile>();
      json['profiles'].forEach((v) {
        profiles.add(new Profile.fromJson(v));
      });
    }
    if (json['addresses'] != null) {
      addresses = new List<Address>();
      json['addresses'].forEach((v) {
        addresses.add(new Address.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['created_at'] = this.createdAt;
    if (this.profiles != null) {
      data['profiles'] = this.profiles.map((v) => v.toJson()).toList();
    }
    if (this.addresses != null) {
      data['addresses'] = this.addresses.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
