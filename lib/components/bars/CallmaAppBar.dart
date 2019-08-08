import 'package:flutter/material.dart';

class CallmaAppBar extends StatelessWidget implements PreferredSizeWidget {
  
  Color backgroundColor = Color.fromARGB(255, 47, 224, 195);
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text("Callma"),
        backgroundColor: backgroundColor
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
