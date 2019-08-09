import 'package:flutter/material.dart';

import '../CallmaColors.dart';

class CallmaAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  CallmaAppBar(this.title);
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(title, style: TextStyle(fontSize: 14)),
        backgroundColor: CallmaColors.BACKGROUND_COLOR
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
