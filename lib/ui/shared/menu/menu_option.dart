import 'package:flutter/material.dart';

class MenuOption {
  final IconData iconData;
  final String text;
  final Function onTap;

  MenuOption(this.iconData, this.text, this.onTap);
}
