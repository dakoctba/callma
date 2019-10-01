import 'package:callma/models/feeling.dart';

class Summary {
  int reviews;
  double average;
  Map<String, Feeling> feelings;

  Summary({this.reviews, this.average, this.feelings});

  Summary.fromJson(Map<String, dynamic> json) {
    reviews = json['reviews'];
    average = json['average'];
    feelings = json['feelings'] != null ? _buildFeelingMap(json['feelings']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reviews'] = this.reviews;
    data['average'] = this.average;
    if (this.feelings != null) {
      // data['feelings'] = this.feelings.map((v) => v.toJson()).toList();
    }
    return data;
  }

  _buildFeelingMap(Map<String, dynamic> feelings) {
    Map<String, Feeling> result = feelings.map((k, v) {
      return new MapEntry(k, Feeling.fromJson(v));
    });

    return result;
  }
}
