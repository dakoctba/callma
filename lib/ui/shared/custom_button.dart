import 'package:callma/themes/callma.theme.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final Function onPressed;
  final bool success;

  CustomButton(this.label, this.onPressed, {this.success = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: SizedBox(
        height: 44.0,
        width: 240.0,
        child: RaisedButton(
            color: success ? SECONDARY_GREEN : PRIMARY_RED,
            textColor: Colors.white,
            onPressed: this.onPressed,
            child: Text(this.label, textAlign: TextAlign.center)),
      ),
    );
  }
}
