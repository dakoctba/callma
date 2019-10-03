import 'package:badges/badges.dart' as BadgesPackage;
import 'package:callma/theme/application_style.dart';
import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  final String status;

  Badge({@required this.status});

  @override
  Widget build(BuildContext context) {
    Color color = Colors.black;
    String text;

    switch (status) {
      case "done":
        text = "Realizada";
        color = ApplicationStyle.SECONDARY_GREY;
        break;
      case "scheduled":
        text = "Agendada";
        color = ApplicationStyle.PRIMARY_GREEN;
        break;
      case "canceled":
        text = "Cancelada";
        color = ApplicationStyle.PRIMARY_RED;
    }

    return BadgesPackage.Badge(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      badgeColor: color,
      shape: BadgesPackage.BadgeShape.square,
      borderRadius: 20,
      toAnimate: false,
      badgeContent: Text(text, style: TextStyle(color: Colors.white, fontSize: 12)),
    );
  }
}