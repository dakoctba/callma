import "package:flutter/material.dart";
import 'package:callma/ui/shared/custom_app_bar.dart';
import 'package:callma/ui/shared/custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:callma/ui/android/help/components/help_body.dart';

class HelpView extends StatefulWidget {
  @override
  _HelpViewState createState() => _HelpViewState();
}

class _HelpViewState extends State<HelpView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar("Ajuda"),
        bottomNavigationBar: CustomBottomNavigationBar(),
        body: HelpBody());
  }
}
