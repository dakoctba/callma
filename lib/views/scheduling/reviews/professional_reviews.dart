import 'package:callma/models/review.dart';
import 'package:callma/theme/application_style.dart';
import 'package:callma/views/scheduling/reviews/review_card.dart';
import 'package:flutter/material.dart';

import 'package:callma/library/custom_app_bar.dart';
import 'package:callma/library/custom_bottom_navigation_bar.dart';
import 'package:callma/library/custom_text.dart';
import 'package:callma/models/professional.dart';
import 'package:callma/views/scheduling/reviews/professional_reviews_header.dart';
import 'package:callma/blocs/reviews_bloc.dart';

class ProfessionalReviews extends StatelessWidget {
  final Professional _professional;

  ProfessionalReviews(this._professional);

  Widget _buildLoadingWidget() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text("Carregando avaliações..."), SizedBox(height: 10), CircularProgressIndicator()],
    ));
  }

  @override
  Widget build(BuildContext context) {
    bloc.getReviews(_professional.id);

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
                    children: <Widget>[
                      CustomText(label: "Avaliações"),
                      SizedBox(height: 20),
                      StreamBuilder<List<Review>>(
                        stream: bloc.subject.stream,
                        builder: (context, AsyncSnapshot<List<Review>> snapshot) {
                          if (snapshot.hasData) {
                            return ListView.separated(
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              itemCount: snapshot.data.length,
                              separatorBuilder: (context, index) =>
                                  Divider(color: ApplicationStyle.SECONDARY_GREY, height: 0),
                              itemBuilder: (context, index) {
                                return ReviewCard(snapshot.data[index]);
                              },
                            );
                          } else {
                            return _buildLoadingWidget();
                          }
                        },
                      )
                    ],
                  ),
                ),
              )
            ])));
  }
}
