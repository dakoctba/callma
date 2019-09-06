import "package:flutter/material.dart";
import 'package:callma/library/custom_app_bar.dart';
import 'package:callma/library/custom_bottom_navigation_bar.dart';
import 'package:callma/views/help/components/help_body.dart';

class HelpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: "Ajuda"),
        bottomNavigationBar: CustomBottomNavigationBar(CustomBottomNavigationBar.HELP_OPTION),
        body: HelpBody());
  }
}
