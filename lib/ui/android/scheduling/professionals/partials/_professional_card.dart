import 'package:callma/blocs/appointment.bloc.dart';
import 'package:callma/helpers/professionals_helper.dart';
import 'package:callma/models/professional.dart';
import 'package:callma/themes/callma.theme.dart';
import 'package:callma/ui/android/scheduling/details/professional_details_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ProfessionalCard extends ListTile {
  final Professional professional;

  ProfessionalCard(this.professional);

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<AppointmentBloc>(context);

    return InkWell(
        child: Card(
          child: Container(
              padding: EdgeInsets.all(20),
              child: Row(
                children: <Widget>[
                  Hero(
                      tag: professional.id,
                      child: Container(
                          child: CircleAvatar(
                            backgroundImage: ProfessionalsHelper.getPhoto(
                                professional.photo),
                            backgroundColor: Colors.transparent,
                          ),
                          width: 40.0,
                          height: 40.0,
                          padding: const EdgeInsets.all(2.0), // borde width
                          decoration: new BoxDecoration(
                            color: professional.sex == "M"
                                ? Colors.blue
                                : Colors.pink, // border color
                            shape: BoxShape.circle,
                          ))),
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
                              color: PRIMARY_GREEN,
                              borderColor: SECONDARY_GREY,
                              spacing: 1.0),
                          Text('R\$ ${professional.price.toStringAsFixed(2)}',
                              style: TextStyle(fontSize: 12)),
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
          bloc.professional = professional;
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProfessionalDetailsView()));
        });
  }
}
