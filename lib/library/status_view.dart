import 'package:callma/library/custom_button.dart';
import 'package:flutter/material.dart';

import 'package:callma/theme/application_style.dart';

class StatusView extends StatelessWidget {
  final String message;
  final bool success;
  final String buttonMessage;
  final Function onPressed;

  StatusView(this.message, this.success, this.buttonMessage, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WillPopScope(
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
                        Icon(Icons.check,
                            color: this.success ? ApplicationStyle.SECONDARY_GREEN : ApplicationStyle.PRIMARY_RED,
                            size: 150),
                        Text(this.message,
                            style: TextStyle(
                                fontSize: 24,
                                color: this.success ? ApplicationStyle.SECONDARY_GREEN : ApplicationStyle.PRIMARY_RED),
                            textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                  CustomButton(label: this.buttonMessage, onPressed: this.onPressed)
                ],
              ))),
    ));
  }
}
