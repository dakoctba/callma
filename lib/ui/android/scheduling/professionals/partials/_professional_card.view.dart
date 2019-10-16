import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:callma/blocs/appointment.bloc.dart';
import 'package:callma/helpers/professionals_helper.dart';
import 'package:callma/models/professional.dart';
import 'package:callma/themes/callma.theme.dart';
import 'package:callma/ui/android/scheduling/details/professional_details.view.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ProfessionalCardView extends StatefulWidget {
  final Professional professional;

  ProfessionalCardView(this.professional);

  @override
  _ProfessionalCardViewState createState() =>
      _ProfessionalCardViewState(this.professional);
}

class _ProfessionalCardViewState extends State<ProfessionalCardView> {
  AppointmentBloc appointmentBloc;
  final Professional professional;

  _ProfessionalCardViewState(this.professional);

  @override
  void initState() {
    appointmentBloc = BlocProvider.getBloc<AppointmentBloc>();
    super.initState();
  }

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
                              borderColor: TERTIARY_GREY,
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
          appointmentBloc.setProfessional(professional);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProfessionalDetailsView()));
        });
  }
}
