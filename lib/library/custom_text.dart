import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String label;

  CustomText({@required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      this.label,
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }
}
