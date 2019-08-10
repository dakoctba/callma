import 'package:flutter/material.dart';

import '../CallmaColors.dart';

class CallmaButton extends StatelessWidget {
  final String label;

  CallmaButton(this.label);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44.0,
      width: 240.0,
      child: RaisedButton(
          color: CallmaColors.VERDE_ESCURO,
          textColor: Colors.white,
          onPressed: () {},
          child: Text(this.label)
      ),
    );
  }
}
