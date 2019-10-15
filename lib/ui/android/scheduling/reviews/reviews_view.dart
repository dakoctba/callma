import 'package:callma/blocs/appointment.bloc.dart';
import 'package:callma/blocs/review.bloc.dart';
import 'package:callma/models/review.dart';
import 'package:callma/themes/callma.theme.dart';
import 'package:callma/ui/android/scheduling/reviews/partials/_review_card.dart';
import 'package:callma/ui/android/scheduling/reviews/partials/_reviews_header.dart';
import 'package:callma/ui/shared/custom_app_bar.dart';
import 'package:callma/ui/shared/custom_bottom_navigation_bar.dart';
import 'package:callma/ui/shared/custom_loading.dart';
import 'package:callma/ui/shared/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReviewsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appointmentBloc = Provider.of<AppointmentBloc>(context);
    final bloc = Provider.of<ReviewBloc>(context);

    bloc.getReviews(appointmentBloc.professional.id);

    return Scaffold(
        appBar: CustomAppBar("Avaliações"),
        bottomNavigationBar: CustomBottomNavigationBar(),
        body: StreamBuilder<List<Review>>(
            stream: bloc.reviewsStream,
            builder: (context, AsyncSnapshot<List<Review>> snapshot) {
              if (!snapshot.hasData) {
                return Text("Carregando reviews...");
              }

              return Padding(
                  padding: EdgeInsets.all(10),
                  child: ListView(children: <Widget>[
                    ProfessionalReviewssHeader(),
                    Card(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            CustomText(label: "Avaliações"),
                            SizedBox(height: 20),
                            StreamBuilder<List<Review>>(
                              stream: bloc.reviewsStream,
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
                                      return ReviewCard(snapshot.data[index]);
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
