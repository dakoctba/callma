import 'package:callma/controllers/appointments_controller.dart';
import 'package:callma/helpers/professionals_helper.dart';
import 'package:callma/models/professional.dart';
import 'package:callma/theme/application_style.dart';
import 'package:callma/views/scheduling/details/professional_details_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ProfessionalCard extends ListTile {
  final Professional professional;

  ProfessionalCard(this.professional);

  @override
  Widget build(BuildContext context) {
    var appointmentsController = Provider.of<AppointmentsController>(context);

    return InkWell(
        child: Card(
          child: Container(
              padding: EdgeInsets.all(20),
              child: Row(
                children: <Widget>[
                  Hero(
                      tag: professional.id,
                      child: CircleAvatar(
                        backgroundImage: ProfessionalsHelper.getPhoto(professional.photo),
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
          appointmentsController.setProfessional(professional);
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfessionalDetailsView()));
        });
  }
}
