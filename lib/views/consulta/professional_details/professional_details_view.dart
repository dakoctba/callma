import 'package:callma/views/consulta/professional_details/professional_details_address.dart';
import 'package:callma/views/consulta/professional_details/professional_details_header.dart';
import 'package:callma/views/consulta/professional_details/professional_details_metrics.dart';
import 'package:callma/views/consulta/professional_details/professional_details_specialties.dart';
import 'package:flutter/material.dart';

import 'package:callma/models/professional.dart';

import 'package:callma/library/custom_app_bar.dart';
import 'package:callma/library/custom_bottom_navigation_bar.dart';

class ProfessionalDetailsView extends StatelessWidget {
  final Professional professional;

  ProfessionalDetailsView(this.professional);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: "Detalhes do profissional"),
        bottomNavigationBar: CustomBottomNavigationBar(CustomBottomNavigationBar.HOME_OPTION),
        body: _body());
  }

  _body() => ListView(
        children: <Widget>[
          ProfessionalDetailsHeader(professional),
          ProfessionalDetailsMetrics(professional),
          ProfessionalDetailsSpecialties(),
          ProfessionalDetailsAddress()
        ],
      );
}
