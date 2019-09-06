import 'package:callma/modules/configurations/components/ConfigurationBody.dart';
import 'package:callma/components/bars/CallmaAppBar.dart';
import 'package:callma/components/bars/CallmaBottomNavigationBar.dart';
import 'package:callma/modules/configurations/screens/QrCodeScreen.dart';
import 'package:callma/util/CallmaIcons.dart';
import "package:flutter/material.dart";

class ConfigurationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CallmaAppBar(title: "Minha conta", actions: <Widget>[
          GestureDetector(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Icon(CallmaIcons.qrcode),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => QrCodeScreen()));
              })
        ]),
        bottomNavigationBar: CallmaBottomNavigationBar(CallmaBottomNavigationBar.CONFIGURATIONS_OPTION),
        body: ConfigurationBody());
  }
}
