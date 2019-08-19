import 'package:cloud_firestore/cloud_firestore.dart';

class Profession {
  String id;
  String description;

  Profession.fromDocument(DocumentSnapshot snapshot) {
    this.id = snapshot.documentID;
    this.description = snapshot.data["name"];
  }
}