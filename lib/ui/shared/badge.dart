import 'package:badges/badges.dart' as BadgesPackage;
import 'package:callma/enumerations/appointment_status.dart';
import 'package:callma/themes/callma.theme.dart';
import 'package:flutter/material.dart';

class Badge extends StatefulWidget {
  final AppointmentStatus status;

  Badge({@required this.status});

  @override
  _BadgeState createState() => _BadgeState(status: status);
}

class _BadgeState extends State<Badge> {
  final AppointmentStatus status;

  _BadgeState({@required this.status});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color textColor;
    String text;

    switch (status) {
      case AppointmentStatus.done:
        text = "Realizada";
        backgroundColor = TERTIARY_GREY;
        textColor = PRIMARY_GREY;
        break;
      case AppointmentStatus.scheduled:
        text = "Agendada";
        backgroundColor = SECONDARY_GREEN;
        textColor = Colors.white;
        break;
      case AppointmentStatus.canceled:
        text = "Cancelada";
        backgroundColor = PRIMARY_RED;
        textColor = Colors.white;
    }

    return BadgesPackage.Badge(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      badgeColor: backgroundColor,
      shape: BadgesPackage.BadgeShape.square,
      borderRadius: 20,
      toAnimate: false,
      badgeContent:
          Text(text, style: TextStyle(color: textColor, fontSize: 12)),
    );
  }
}
