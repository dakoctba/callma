import 'dart:convert';

import 'package:callma/blocs/user.bloc.dart';
import 'package:callma/ui/shared/custom_app_bar.dart';
import 'package:callma/ui/shared/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var userBloc = Provider.of<UserBloc>(context);

    var content = {"userId": userBloc.user.id, "texto": "Show de bola"};

    return Scaffold(
        appBar: CustomAppBar("Meu QrCode"),
        bottomNavigationBar: CustomBottomNavigationBar(),
        body: Center(
            child: QrImage(
          data: jsonEncode(content),
          version: QrVersions.auto,
          size: 200.0,
        )));
  }
}
