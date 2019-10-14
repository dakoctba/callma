import 'package:flutter/material.dart';

class CustomLoading extends StatelessWidget {
  final String _text;

  CustomLoading(this._text);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(this._text),
        SizedBox(height: 10),
        CircularProgressIndicator()
      ],
    ));
  }
}
