import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String id;
  String name;
  String email;
  String password;

  User.fromDocument(DocumentSnapshot snapshot) {
    this.id = snapshot.documentID;
    this.name = snapshot.data["name"];
    this.email = snapshot.data["email"];
    this.password = snapshot.data["password"];
  }
}