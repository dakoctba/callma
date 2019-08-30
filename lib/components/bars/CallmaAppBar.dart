import 'package:flutter/material.dart';

import '../CallmaColors.dart';

class CallmaAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget> actions;

  CallmaAppBar(this.title, {this.actions});
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(title),
        centerTitle: false,
        backgroundColor: CallmaColors.BACKGROUND_COLOR,
        actions: this.actions

    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
