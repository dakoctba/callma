import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:callma/blocs/appointment.bloc.dart';
import 'package:callma/ui/android/scheduling/details/partials/_calendar_card.dart';
import 'package:callma/ui/android/scheduling/details/partials/_clinics_card.view.dart';
import 'package:callma/ui/android/scheduling/details/partials/_header_card.view.dart';
import 'package:callma/ui/android/scheduling/details/partials/_specialties_card.dart';
import 'package:callma/ui/shared/custom_app_bar.dart';
import 'package:callma/ui/shared/custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class ProfessionalDetailsView extends StatefulWidget {
  @override
  _ProfessionalDetailsViewState createState() =>
      _ProfessionalDetailsViewState();
}

class _ProfessionalDetailsViewState extends State<ProfessionalDetailsView> {
  AppointmentBloc appointmentBloc;

  @override
  void initState() {
    appointmentBloc = BlocProvider.getBloc<AppointmentBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar("Detalhes do profissional"),
        bottomNavigationBar: CustomBottomNavigationBar(),
        body: Container(
            padding: EdgeInsets.all(5),
            child: ListView(children: <Widget>[
              HeaderCardView(appointmentBloc.professional),
              SpecialtiesCard(appointmentBloc.professional),
              appointmentBloc.address == null
                  ? ClinicsCardView(
                      appointmentBloc.professional.clinics, null, (_) {})
                  : Container(),
              CalendarCard()
            ])));
  }
}
