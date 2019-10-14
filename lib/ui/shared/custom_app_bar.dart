import 'package:flutter/material.dart';

import 'package:callma/themes/callma.theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget> actions;

  CustomAppBar({this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: this.title == null
            ? Image.asset("assets/images/logos/logo.png")
            : Text(title),
        centerTitle: this.title == null ? true : false,
        backgroundColor: CallmaTheme.PRIMARY_GREEN,
        actions: this.actions);
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
