import 'package:flutter/material.dart';

import 'package:callma/themes/callma.theme.dart';

class CustomSwitchListTile extends StatelessWidget {
  final String label;

  CustomSwitchListTile(this.label);

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
        value: true,
        title: new Text(label),
        onChanged: (value) {},
        activeTrackColor: PRIMARY_GREEN,
        activeColor: SECONDARY_GREEN);
  }
}
