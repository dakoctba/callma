import 'package:flutter/material.dart';

class CustomLoading extends StatelessWidget {
  final String text;

  CustomLoading(this.text);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Carregando avaliações..."),
        SizedBox(height: 10),
        CircularProgressIndicator()
      ],
    ));
  }
}
