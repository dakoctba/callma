import 'package:callma/library/custom_app_bar.dart';
import 'package:callma/library/custom_bottom_navigation_bar.dart';
import 'package:callma/views/scheduling/details/partials/_address_card.dart';
import 'package:callma/views/scheduling/details/partials/_calendar_card.dart';
import 'package:callma/views/scheduling/details/partials/_header_card.dart';
import 'package:callma/views/scheduling/details/partials/_specialties_card.dart';
import 'package:flutter/material.dart';

class ProfessionalDetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: "Detalhes do profissional"),
        bottomNavigationBar: CustomBottomNavigationBar(),
        body: Container(
            padding: EdgeInsets.all(10),
            child: ListView(children: <Widget>[HeaderCard(), SpecialtiesCard(), AddressCard(), CalendarCard()])));
  }
}
