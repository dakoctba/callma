import 'package:flutter/material.dart';

import '../CallmaColors.dart';

class CallmaButton extends StatelessWidget {
  final String label;
  final Function onPressed;

  CallmaButton(this.label, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: SizedBox(
        height: 44.0,
        width: 240.0,
        child: RaisedButton(
            color: CallmaColors.VERDE_ESCURO,
            textColor: Colors.white,
            onPressed: this.onPressed,
            child: Text(this.label)
        ),
      ),
    );
  }
}
