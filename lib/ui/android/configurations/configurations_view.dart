import 'package:callma/ui/android/configurations/components/configuration_body.dart';
import 'package:callma/ui/shared/custom_app_bar.dart';
import 'package:callma/ui/shared/custom_bottom_navigation_bar.dart';
import 'package:callma/ui/android/configurations/qrcode_view.dart';
import 'package:callma/themes/callma_icons.dart';
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => QrCodeView()));
              })
        ]),
        bottomNavigationBar: CustomBottomNavigationBar(),
        body: ConfigurationBody());
  }
}
