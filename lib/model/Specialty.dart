import 'package:cloud_firestore/cloud_firestore.dart';

class Specialty {
  String professionId;
  String id;
  String title;
  String subtitle;

  Specialty.fromDocument(DocumentSnapshot snapshot) {
    this.id = snapshot.documentID;
    this.title = snapshot.data["name"];
    this.subtitle = snapshot.data["subtitle"];
  }
}