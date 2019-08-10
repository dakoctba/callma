import 'package:flutter/material.dart';

import '../CallmaColors.dart';

class CallmaSwitchListTile extends StatelessWidget {
  final String label;

  CallmaSwitchListTile(this.label);

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: false,
      title: new Text(label),
      onChanged: (value){},
      activeTrackColor: CallmaColors.BACKGROUND_COLOR,
      activeColor: CallmaColors.VERDE_ESCURO
    );
  }
}
