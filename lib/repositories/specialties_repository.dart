import 'package:callma/models/specialty.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SpecialtiesRepository {
  static Future<List<Specialty>> getSpecialties(String professionId) async {
    List<Specialty> items = new List<Specialty>();

    QuerySnapshot snapshot = await Firestore.instance
        .collection('professions')
        .document(professionId)
        .collection("specialties")
        .getDocuments();

    for (DocumentSnapshot document in snapshot.documents) {
      items.add(Specialty.fromDocument(document));
    }

    return items;
  }
}
