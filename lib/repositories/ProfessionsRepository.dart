import 'package:callma/models/Profession.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfessionsRepository {
  static Future<List<Profession>> getProfessions() async {
    List<Profession> items = new List<Profession>();

    QuerySnapshot snapshot = await Firestore.instance.collection('professions').getDocuments();

    for (DocumentSnapshot document in snapshot.documents) {
      items.add(Profession.fromDocument(document));
    }

    return items;
  }
}
