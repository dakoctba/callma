import 'package:cloud_firestore/cloud_firestore.dart';

class Profession {
  String id;
  String title;
  String subtitle;

  Profession.fromDocument(DocumentSnapshot snapshot) {
    this.id = snapshot.documentID;
    this.title = snapshot.data["name"];
    this.subtitle = snapshot.data["subtitle"];
  }
}