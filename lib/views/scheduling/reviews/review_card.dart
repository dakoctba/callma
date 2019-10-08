import 'package:callma/helpers/professionals_helper.dart';
import 'package:callma/models/profile.dart';
import 'package:callma/models/review.dart';
import 'package:callma/theme/application_style.dart';
import 'package:farm/helpers/date_helper.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ReviewCard extends StatelessWidget with DateHelper {
  final Review _review;

  ReviewCard(this._review);

  @override
  Widget build(BuildContext context) {
    Profile profile = _review.user.profiles[0];

    return Container(
      padding: EdgeInsets.only(bottom: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: ProfessionalsHelper.getPhoto(_review.user.profiles[0].photo),
                backgroundColor: Colors.transparent,
                radius: 16,
              ),
              SizedBox(width: 10),
              Text(profile.name)
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              SmoothStarRating(
                  allowHalfRating: false,
                  starCount: 5,
                  rating: _review.stars.toDouble(),
                  size: 16,
                  color: ApplicationStyle.PRIMARY_GREEN,
                  borderColor: ApplicationStyle.SECONDARY_GREY,
                  spacing: 1.0),
              SizedBox(width: 10),
              Text(formatStringDateWithHours(_review.createdAt))
            ],
          ),
          SizedBox(height: 10),
          Text(_review.description)
        ],
      ),
    );

    // return Row(
    //   children: <Widget>[

    //     Column(children: <Widget>[Text(_review.description)])
    //   ],
    // );
  }
}
