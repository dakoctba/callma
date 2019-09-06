import 'package:callma/models/professional.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfessionalsRepository {
  static Future<List<Professional>> getProfessionals(String professionId) async {
    List<Professional> items = new List<Professional>();

    QuerySnapshot snapshot = await Firestore.instance.collection('professionals').getDocuments();

    for (DocumentSnapshot document in snapshot.documents) {
      items.add(Professional.fromDocument(document));
    }

    return items;
  }
}
