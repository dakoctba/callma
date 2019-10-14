import 'package:callma/ui/shared/custom_app_bar.dart';
import 'package:callma/ui/shared/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: "Meu QrCode"),
        bottomNavigationBar: CustomBottomNavigationBar(),
        body: Center(
            child: QrImage(
          data: "https://callma.com.br",
          version: QrVersions.auto,
          size: 200.0,
        )));
  }
}
