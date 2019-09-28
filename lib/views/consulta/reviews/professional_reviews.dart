import 'package:callma/library/custom_app_bar.dart';
import 'package:callma/library/custom_bottom_navigation_bar.dart';
import 'package:callma/library/custom_text.dart';
import 'package:callma/models/professional.dart';
import 'package:callma/views/consulta/reviews/professional_reviews_header.dart';
import 'package:flutter/material.dart';

class ProfessionalReviews extends StatelessWidget {
  final Professional _professional;

  ProfessionalReviews(this._professional);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: "Avaliações"),
        bottomNavigationBar: CustomBottomNavigationBar(CustomBottomNavigationBar.HOME_OPTION),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(children: <Widget>[
              ProfessionalReviewssHeader(_professional),
              Card(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[CustomText(label: "Avaliações"), SizedBox(height: 20), Text("...avaliações...")],
                  ),
                ),
              )
            ])));
  }
}
