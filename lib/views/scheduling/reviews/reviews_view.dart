import 'package:callma/controllers/appointments_controller.dart';
import 'package:callma/controllers/reviews_controller.dart';
import 'package:callma/library/custom_app_bar.dart';
import 'package:callma/library/custom_bottom_navigation_bar.dart';
import 'package:callma/library/custom_text.dart';
import 'package:callma/models/professional.dart';
import 'package:callma/models/review.dart';
import 'package:callma/theme/application_style.dart';
import 'package:callma/views/scheduling/reviews/partials/_reviews_header.dart';
import 'package:callma/views/scheduling/reviews/partials/_review_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReviewsView extends StatelessWidget {
  Widget _buildLoadingWidget() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text("Carregando avaliações..."), SizedBox(height: 10), CircularProgressIndicator()],
    ));
  }

  @override
  Widget build(BuildContext context) {
    final appointmentsController = Provider.of<AppointmentsController>(context);
    final reviewsController = Provider.of<ReviewsController>(context);

    return StreamBuilder<Professional>(
      stream: appointmentsController.professionalStream,
      builder: (context, AsyncSnapshot<Professional> professionalSnapshot) {
        if (!professionalSnapshot.hasData) {
          return Text("Carregando profissional...");
        }

        return Scaffold(
            appBar: CustomAppBar(title: "Avaliações"),
            bottomNavigationBar: CustomBottomNavigationBar(),
            body: StreamBuilder<List<Review>>(
                stream: reviewsController.reviewsStream,
                builder: (context, AsyncSnapshot<List<Review>> snapshot) {
                  if (!snapshot.hasData) {
                    return Text("Carregando reviews...");
                  }

                  return Padding(
                      padding: EdgeInsets.all(10),
                      child: ListView(children: <Widget>[
                        ProfessionalReviewssHeader(professionalSnapshot.data),
                        Card(
                          child: Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                CustomText(label: "Avaliações"),
                                SizedBox(height: 20),
                                StreamBuilder<List<Review>>(
                                  stream: reviewsController.reviewsStream,
                                  builder: (context, AsyncSnapshot<List<Review>> snapshot) {
                                    if (snapshot.hasData) {
                                      if (snapshot.data.length == 0) {
                                        return Text("O profissional ainda não foi avaliado.");
                                      }

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
                      ]));
                }));
      },
    );
  }
}
