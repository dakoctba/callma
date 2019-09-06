import 'package:callma/modules/help/components/help_body.dart';
import 'package:callma/components/bars/callma_app_bar.dart';
import 'package:callma/components/bars/callma_bottom_navigation_bar.dart';
import "package:flutter/material.dart";

class HelpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CallmaAppBar(title: "Ajuda"),
        bottomNavigationBar: CallmaBottomNavigationBar(CallmaBottomNavigationBar.HELP_OPTION),
        body: HelpBody());
  }
}
