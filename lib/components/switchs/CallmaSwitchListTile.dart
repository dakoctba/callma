import 'package:flutter/material.dart';

import 'package:callma/theme/CallmaColors.dart';

class CallmaSwitchListTile extends StatelessWidget {
  final String label;

  CallmaSwitchListTile(this.label);

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
        value: true,
        title: new Text(label),
        onChanged: (value) {},
        activeTrackColor: CallmaColors.PRIMARY_GREEN,
        activeColor: CallmaColors.SECONDARY_GREEN);
  }
}
