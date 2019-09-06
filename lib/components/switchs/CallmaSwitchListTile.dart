import 'package:flutter/material.dart';

import 'package:callma/theme/ApplicationStyle.dart';

class CallmaSwitchListTile extends StatelessWidget {
  final String label;

  CallmaSwitchListTile(this.label);

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
        value: true,
        title: new Text(label),
        onChanged: (value) {},
        activeTrackColor: ApplicationStyle.PRIMARY_GREEN,
        activeColor: ApplicationStyle.SECONDARY_GREEN);
  }
}
