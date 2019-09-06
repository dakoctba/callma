import 'package:callma/components/buttons/CallmaButton.dart';
import 'package:flutter/material.dart';

import 'package:callma/theme/ApplicationStyle.dart';

class StatusScreen extends StatelessWidget {
  final String message;
  final bool success;
  final String buttonMessage;
  final Function onPressed;

  StatusScreen(this.message, this.success, this.buttonMessage, this.onPressed);

  _getIcon() {
    return this.success == true
        ? Icon(Icons.check, color: ApplicationStyle.SECONDARY_GREEN, size: 150)
        : Icon(Icons.clear, color: ApplicationStyle.PRIMARY_RED, size: 150);
  }

  _getText() {
    return this.success == true
        ? Text(this.message,
            style: TextStyle(
                fontSize: 24, color: ApplicationStyle.SECONDARY_GREEN),
            textAlign: TextAlign.center)
        : Text(this.message,
            style: TextStyle(fontSize: 24, color: ApplicationStyle.PRIMARY_RED),
            textAlign: TextAlign.center);
  }

  _body() {
    return Center(
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
                CallmaButton(this.buttonMessage, this.onPressed)
              ],
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body());
  }
}
