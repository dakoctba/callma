import 'package:callma/models/address.dart';
import 'package:callma/models/profile.dart';

class User {
  int id;
  String email;
  String password;
  String userType;

  bool receiveReceipts;
  int maxPerimeter;
  int hoursToSearch;
  bool showAlerts;
  int hoursToReceiveAlerts;

  String createdAt;
  List<Profile> profiles;
  List<Address> addresses;

  User({this.id, this.email, this.userType, this.createdAt, this.profiles, this.addresses});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    userType = json['user_type'];
    receiveReceipts = json['receive_receipts'];
    maxPerimeter = json['max_perimeter'];
    hoursToSearch = json['hours_to_search'];
    showAlerts = json['show_alerts'];
    hoursToReceiveAlerts = json['hours_to_receive_alerts'];
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
    data['user_type'] = this.userType;
    data['receive_receipts'] = this.receiveReceipts;
    data['max_perimeter'] = this.maxPerimeter;
    data['hours_to_search'] = this.hoursToSearch;
    data['show_alerts'] = this.showAlerts;
    data['hours_to_receive_alerts'] = this.hoursToReceiveAlerts;
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
