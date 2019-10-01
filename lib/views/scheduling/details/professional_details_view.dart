import 'package:callma/views/scheduling/details/professional_details_address.dart';
import 'package:callma/views/scheduling/details/professional_details_calendar.dart';
import 'package:callma/views/scheduling/details/professional_details_header.dart';
import 'package:callma/views/scheduling/details/professional_details_specialties.dart';
import 'package:flutter/material.dart';

import 'package:callma/models/professional.dart';

import 'package:callma/library/custom_app_bar.dart';
import 'package:callma/library/custom_bottom_navigation_bar.dart';

class ProfessionalDetailsView extends StatelessWidget {
  final Professional _professional;

  ProfessionalDetailsView(this._professional);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: "Detalhes do profissional"),
        bottomNavigationBar: CustomBottomNavigationBar(CustomBottomNavigationBar.HOME_OPTION),
        body: Container(
            padding: EdgeInsets.all(10),
            child: ListView(children: <Widget>[
              ProfessionalDetailsHeader(_professional),
              ProfessionalDetailsSpecialties(_professional),
              ProfessionalDetailsAddress(_professional.clinics),
              ProfessionalDetailsCalendar(_professional)
            ])));
  }
}
