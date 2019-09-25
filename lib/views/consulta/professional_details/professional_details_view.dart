import 'package:callma/theme/application_style.dart';
import 'package:callma/views/consulta/professional_details/professional_details_address.dart';
import 'package:callma/views/consulta/professional_details/professional_details_calendar.dart';
import 'package:callma/views/consulta/professional_details/professional_details_header.dart';
import 'package:callma/views/consulta/professional_details/professional_details_metrics.dart';
import 'package:callma/views/consulta/professional_details/professional_details_specialties.dart';
import 'package:flutter/material.dart';

import 'package:callma/models/professional.dart';

import 'package:callma/library/custom_app_bar.dart';
import 'package:callma/library/custom_bottom_navigation_bar.dart';
import 'package:callma/blocs/professional_bloc.dart';

class ProfessionalDetailsView extends StatelessWidget {
  final int professionalId;

  ProfessionalDetailsView(this.professionalId);

  Widget _buildLoadingWidget() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text("Carregando dados do profissional..."), CircularProgressIndicator()],
    ));
  }

  @override
  Widget build(BuildContext context) {
    bloc.getProfessionals(this.professionalId);

    return Scaffold(
      appBar: CustomAppBar(title: "Detalhes do profissional"),
      bottomNavigationBar: CustomBottomNavigationBar(CustomBottomNavigationBar.HOME_OPTION),
      body: StreamBuilder<Professional>(
        stream: bloc.subject.stream,
        builder: (context, AsyncSnapshot<Professional> snapshot) {
          if (snapshot.hasData) {
            return Padding(
                padding: EdgeInsets.all(10),
                child: ListView(children: <Widget>[
                  ProfessionalDetailsHeader(snapshot.data),
                  ProfessionalDetailsSpecialties(),
                  ProfessionalDetailsAddress(),
                  ProfessionalDetailsCalendar()
                ]));
          } else {
            return _buildLoadingWidget();
          }
        },
      ),
    );
  }
}
