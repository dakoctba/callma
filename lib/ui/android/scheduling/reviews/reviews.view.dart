import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:callma/blocs/review.bloc.dart';
import 'package:callma/models/professional.dart';
import 'package:callma/models/review.dart';
import 'package:callma/themes/callma.theme.dart';
import 'package:callma/ui/android/scheduling/reviews/partials/_review_card.view.dart';
import 'package:callma/ui/android/scheduling/reviews/partials/_reviews_header.view.dart';
import 'package:callma/ui/shared/custom_app_bar.dart';
import 'package:callma/ui/shared/custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:callma/ui/shared/custom_loading.dart';
import 'package:callma/ui/shared/custom_text.dart';
import 'package:flutter/material.dart';

class ReviewsView extends StatefulWidget {
  final Professional professional;

  ReviewsView(this.professional);

  @override
  _ReviewsViewState createState() => _ReviewsViewState(this.professional);
}

class _ReviewsViewState extends State<ReviewsView> {
  final Professional professional;
  ReviewBloc reviewBloc;

  _ReviewsViewState(this.professional);

  @override
  void initState() {
    reviewBloc = BlocProvider.getBloc<ReviewBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    reviewBloc.getReviews(professional.id);

    return Scaffold(
        appBar: CustomAppBar("Avaliações"),
        bottomNavigationBar: CustomBottomNavigationBar(),
        body: StreamBuilder<List<Review>>(
            stream: reviewBloc.reviewsStream,
            builder: (context, AsyncSnapshot<List<Review>> snapshot) {
              if (!snapshot.hasData) {
                return Center(child: Text("Carregando reviews..."));
              }

              if (snapshot.data.length == 0) {
                return Center(
                    child:
                        Text("Este profissional ainda não recebeu avaliações"));
              }

              return Padding(
                  padding: EdgeInsets.all(5),
                  child: ListView(children: <Widget>[
                    ProfessionalReviewssHeaderView(professional),
                    Card(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            CustomText("Avaliações"),
                            SizedBox(height: 20),
                            StreamBuilder<List<Review>>(
                              stream: reviewBloc.reviewsStream,
                              builder: (context,
                                  AsyncSnapshot<List<Review>> snapshot) {
                                if (snapshot.hasData) {
                                  if (snapshot.data.length == 0) {
                                    return Text(
                                        "O profissional ainda não foi avaliado.");
                                  }

                                  return ListView.separated(
                                    shrinkWrap: true,
                                    physics: ClampingScrollPhysics(),
                                    itemCount: snapshot.data.length,
                                    separatorBuilder: (context, index) =>
                                        Divider(
                                            color: SECONDARY_GREY, height: 0),
                                    itemBuilder: (context, index) {
                                      return ReviewCardView(
                                          snapshot.data[index]);
                                    },
                                  );
                                } else {
                                  return CustomLoading("Carregando avaliações");
                                }
                              },
                            )
                          ],
                        ),
                      ),
                    )
                  ]));
            }));
  }
}
