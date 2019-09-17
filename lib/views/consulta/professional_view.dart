import 'package:flutter/material.dart';

import 'package:callma/library/custom_app_bar.dart';
import 'package:callma/library/custom_bottom_navigation_bar.dart';

class ProfessionalView extends StatefulWidget {
  @override
  _ProfessionalViewState createState() => _ProfessionalViewState();
}

class _ProfessionalViewState extends State<ProfessionalView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: "Detalhes do profissional"),
        bottomNavigationBar: CuesstomBottomNavigationBar(CustomBottomNavigationBar.HOME_OPTION),
        body: Container());
  }
}
