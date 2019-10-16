import 'package:callma/ui/android/notifications/notifications.view.dart';
import 'package:flutter/material.dart';

import 'package:callma/themes/callma.theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget> actions;

  CustomAppBar(this.title, {this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: this.title == null
            ? Image.asset("assets/images/logos/logo.png")
            : Text(title),
        centerTitle: this.title == null ? true : false,
        backgroundColor: PRIMARY_GREEN,
        actions: _getActions(context));
  }

  List<Widget> _getActions(BuildContext context) {
    var _actions = List<Widget>();

    _actions.add(GestureDetector(
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Icon(Icons.notifications),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => NotificationsView()));
        }));

    if (actions != null) {
      _actions.addAll(actions);
    }

    _actions.add(SizedBox(width: 10));

    return _actions;
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
