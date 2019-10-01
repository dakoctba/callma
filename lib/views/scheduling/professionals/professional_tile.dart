import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import 'package:callma/config/callma_config.dart';
import 'package:callma/models/professional.dart';
import 'package:callma/theme/application_style.dart';
import 'package:callma/views/scheduling/details/professional_details_view.dart';

class ProfessionalTile extends ListTile {
  final Professional professional;

  ProfessionalTile(this.professional);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Card(
          child: Container(
              padding: EdgeInsets.all(20),
              child: Row(
                children: <Widget>[
                  Hero(
                      tag: professional.id,
                      child: CircleAvatar(
                        backgroundImage: professional.photo != null
                            ? NetworkImage(professional.photo)
                            : AssetImage(CallmaConfig.DEFAULT_PHOTO),
                        backgroundColor: Colors.transparent,
                      )),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(professional.name),
                      SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SmoothStarRating(
                              allowHalfRating: false,
                              starCount: 5,
                              rating: professional.stars.toDouble(),
                              size: 16,
                              color: ApplicationStyle.PRIMARY_GREEN,
                              borderColor: ApplicationStyle.SECONDARY_GREY,
                              spacing: 1.0),
                          Text('R\$ ${professional.price.toStringAsFixed(2)}', style: TextStyle(fontSize: 12)),
                          Text(
                            '8km',
                            style: TextStyle(fontSize: 12),
                            textAlign: TextAlign.right,
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              )),
        ),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfessionalDetailsView(professional)));
        });
  }
}
