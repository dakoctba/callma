import 'package:callma/ui/shared/custom_button.dart';
import 'package:flutter/material.dart';

import 'package:callma/themes/callma.theme.dart';

class StatusView extends StatefulWidget {
  final String message;
  final bool success;
  final String buttonMessage;
  final Function onPressed;

  StatusView(this.message, this.success, this.buttonMessage, this.onPressed);

  @override
  _StatusViewState createState() => _StatusViewState(
      this.message, this.success, this.buttonMessage, this.onPressed);
}

class _StatusViewState extends State<StatusView> {
  final String message;
  final bool success;
  final String buttonMessage;
  final Function onPressed;

  _StatusViewState(
      this.message, this.success, this.buttonMessage, this.onPressed);

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
                            color: this.success ? SECONDARY_GREEN : PRIMARY_RED,
                            size: 150),
                        Text(this.message,
                            style: TextStyle(
                                fontSize: 24,
                                color: this.success
                                    ? SECONDARY_GREEN
                                    : PRIMARY_RED),
                            textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                  CustomButton(this.buttonMessage, this.onPressed)
                ],
              ))),
    ));
  }
}
