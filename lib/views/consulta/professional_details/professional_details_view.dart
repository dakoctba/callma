import 'package:flutter/material.dart';

import 'package:callma/library/custom_app_bar.dart';
import 'package:callma/library/custom_bottom_navigation_bar.dart';

class ProfessionalDetailsView extends StatefulWidget {
  @override
  _ProfessionalViewState createState() => _ProfessionalViewState();
}

class _ProfessionalViewState extends State<ProfessionalDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: "Detalhes do profissional"),
        bottomNavigationBar: CustomBottomNavigationBar(CustomBottomNavigationBar.HOME_OPTION),
        body: Container());
  }
}
