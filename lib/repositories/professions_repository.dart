import 'package:callma/models/profession.dart';
import 'package:dio/dio.dart';

import 'dart:convert';

// import 'package:cloud_firestore/cloud_firestore.dart';

class ProfessionsRepository {
  static Future<List<Profession>> getProfessions() async {
    List<Profession> items = new List<Profession>();

    // QuerySnapshot snapshot = await Firestore.instance.collection('professions').getDocuments();

    // for (DocumentSnapshot document in snapshot.documents) {
    //   items.add(Profession.fromDocument(document));
    // }

    try {
      Response response = await Dio().get("https://callma-api.herokuapp.com/api/professions");

      for (Map<String, dynamic> item in response.data) {
        items.add(Profession.fromJson(item));
      }

      // print("----------------------------------");

      // for (int i = 0; i < response.data.length; i++) {
      //   // print(response.data[i]);
      //   items.add(Profession.fromJson(response.data[i]));
      // }

      // response.data.map((item) {

      // });

      // items = (response as List).map((i) => Profession.fromJson(i)).toList();

      print(response);
    } catch (e) {
      print(e);
    }

    return items;
  }
}
