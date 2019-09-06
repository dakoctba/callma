import 'package:callma/modules/help/components/HelpBody.dart';
import 'package:callma/components/bars/CallmaAppBar.dart';
import 'package:callma/components/bars/CallmaBottomNavigationBar.dart';
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
