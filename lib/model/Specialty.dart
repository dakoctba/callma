import 'package:cloud_firestore/cloud_firestore.dart';

class Specialty {
  String professionId;
  String id;
  String description;

  Specialty.fromDocument(DocumentSnapshot snapshot) {
    this.id = snapshot.documentID;
    this.description = snapshot.data["name"];
  }
}