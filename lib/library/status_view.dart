import 'package:callma/library/custom_button.dart';
import 'package:flutter/material.dart';

import 'package:callma/theme/application_style.dart';

class StatusView extends StatelessWidget {
  final String message;
  final bool success;
  final String buttonMessage;
  final Function onPressed;

  StatusView(this.message, this.success, this.buttonMessage, this.onPressed);

  Icon _getIcon() {
    return this.success == true
        ? Icon(Icons.check, color: ApplicationStyle.SECONDARY_GREEN, size: 150)
        : Icon(Icons.clear, color: ApplicationStyle.PRIMARY_RED, size: 150);
  }

  Text _getText() {
    return this.success == true
        ? Text(this.message,
            style: TextStyle(fontSize: 24, color: ApplicationStyle.SECONDARY_GREEN), textAlign: TextAlign.center)
        : Text(this.message,
            style: TextStyle(fontSize: 24, color: ApplicationStyle.PRIMARY_RED), textAlign: TextAlign.center);
  }

  Widget _body() {
    return WillPopScope(
      onWillPop: () async => false,
      child: Center(
          child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        _getIcon(),
                        _getText(),
                      ],
                    ),
                  ),
                  CustomButton(label: this.buttonMessage, onPressed: this.onPressed)
                ],
              ))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body());
  }
}
