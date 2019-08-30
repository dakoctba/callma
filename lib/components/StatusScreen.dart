import 'package:callma/components/buttons/CallmaButton.dart';
import 'package:flutter/material.dart';

import 'CallmaColors.dart';

class StatusScreen extends StatelessWidget {
  final String message;
  final bool success;
  final String buttonMessage;
  final Function onPressed;

  StatusScreen(this.message, this.success, this.buttonMessage, this.onPressed);

  _getIcon() {
    return this.success == true
        ? Icon(Icons.check, color: CallmaColors.VERDE_ESCURO, size: 150)
        : Icon(Icons.clear, color: CallmaColors.VERMELHO, size: 150);
  }

  _getText() {
    return this.success == true
        ? Text(this.message, style: TextStyle(fontSize: 24, color: CallmaColors.VERDE_ESCURO), textAlign: TextAlign.center)
        : Text(this.message, style: TextStyle(fontSize: 24, color: CallmaColors.VERMELHO), textAlign: TextAlign.center);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
        ),
      ),
    );
  }
}
