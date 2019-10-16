import 'dart:convert';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:callma/blocs/user.bloc.dart';
import 'package:callma/ui/shared/custom_app_bar.dart';
import 'package:callma/ui/shared/custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeView extends StatefulWidget {
  @override
  _QrCodeViewState createState() => _QrCodeViewState();
}

class _QrCodeViewState extends State<QrCodeView> {
  UserBloc userBloc;

  @override
  void initState() {
    userBloc = BlocProvider.getBloc<UserBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var content = {"userId": userBloc.user.id, "message": ""};

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
