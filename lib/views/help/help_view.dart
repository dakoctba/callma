import "package:flutter/material.dart";
import 'package:callma/components/bars/callma_app_bar.dart';
import 'package:callma/components/bars/callma_bottom_navigation_bar.dart';
import 'package:callma/views/help/components/help_body.dart';

class HelpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CallmaAppBar(title: "Ajuda"),
        bottomNavigationBar: CallmaBottomNavigationBar(CallmaBottomNavigationBar.HELP_OPTION),
        body: HelpBody());
  }
}
