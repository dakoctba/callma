import 'package:cloud_firestore/cloud_firestore.dart';

class Professional {
  String id;
  String name;
  int stars;
  String address;
  String photo;
  int price;

  Professional.fromDocument(DocumentSnapshot snapshot) {
    this.id = snapshot.documentID;
    this.name = snapshot.data["name"];
    this.stars = snapshot.data["stars"];
    this.address = snapshot.data["address"];
    this.price = snapshot.data["price"];
    this.photo = snapshot.data["photo"];
  }
}