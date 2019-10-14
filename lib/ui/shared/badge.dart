import 'package:badges/badges.dart' as BadgesPackage;
import 'package:callma/enumerations/appointment_status.dart';
import 'package:callma/themes/callma.theme.dart';
import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  final AppointmentStatus status;

  Badge({@required this.status});

  @override
  Widget build(BuildContext context) {
    Color color = Colors.black;
    String text;

    switch (status) {
      case AppointmentStatus.done:
        text = "Realizada";
        color = CallmaTheme.SECONDARY_GREY;
        break;
      case AppointmentStatus.scheduled:
        text = "Agendada";
        color = CallmaTheme.PRIMARY_GREEN;
        break;
      case AppointmentStatus.canceled:
        text = "Cancelada";
        color = CallmaTheme.PRIMARY_RED;
    }

    return BadgesPackage.Badge(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      badgeColor: color,
      shape: BadgesPackage.BadgeShape.square,
      borderRadius: 20,
      toAnimate: false,
      badgeContent:
          Text(text, style: TextStyle(color: Colors.white, fontSize: 12)),
    );
  }
}
