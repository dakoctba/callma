import 'package:callma/views/configurations/components/configuration_body.dart';
import 'package:callma/components/bars/callma_app_bar.dart';
import 'package:callma/components/bars/callma_bottom_navigation_bar.dart';
import 'package:callma/views/configurations/qrcode_view.dart';
import 'package:callma/theme/callma_icons.dart';
import "package:flutter/material.dart";

class ConfigurationsView extends StatelessWidget {
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
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => QrCodeView()));
              })
        ]),
        bottomNavigationBar: CallmaBottomNavigationBar(CallmaBottomNavigationBar.CONFIGURATIONS_OPTION),
        body: ConfigurationBody());
  }
}