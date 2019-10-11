import 'package:callma/views/configurations/components/configuration_body.dart';
import 'package:callma/library/custom_app_bar.dart';
import 'package:callma/library/custom_bottom_navigation_bar.dart';
import 'package:callma/views/configurations/qrcode_view.dart';
import 'package:callma/theme/callma_icons.dart';
import "package:flutter/material.dart";

class ConfigurationsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: "Minha conta", actions: <Widget>[
          GestureDetector(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Icon(CallmaIcons.qrcode),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => QrCodeView()));
              })
        ]),
        bottomNavigationBar: CustomBottomNavigationBar(CustomBottomNavigationBar.CONFIGURATIONS_OPTION),
        body: ConfigurationBody());
  }
}
