import 'package:flutter/material.dart';

import 'package:callma/library/custom_app_bar.dart';
import 'package:callma/library/custom_bottom_navigation_bar.dart';
import 'package:callma/models/profession.dart';
import 'package:callma/repositories/professions_repository.dart';
import 'package:callma/views/consulta/components/professions_view_body.dart';

class ProfessionsView extends StatefulWidget {
  @override
  _ProfessionsScreenState createState() => _ProfessionsScreenState();
}

class _ProfessionsScreenState extends State<ProfessionsView> {
  List<Profession> professions = new List<Profession>();

  @override
  void initState() {
    super.initState();

    ProfessionsRepository.getProfessions().then((data) {
      setState(() {
        professions = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: "Profissional"),
        bottomNavigationBar: CustomBottomNavigationBar(CustomBottomNavigationBar.HOME_OPTION),
        body: ProfessionsViewBody(this.professions));
  }
}
