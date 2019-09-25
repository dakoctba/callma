import 'package:callma/library/custom_text.dart';
import 'package:flutter/material.dart';

class ProfessionalDetailsAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                CustomText(label: "Endereço do consultório"),
                SizedBox(height: 10),
                Text("Rua Padre Anchieta, 1846"),
                Text("Bigorrilho"),
                Text("Curitiba - PR")
              ],
            )));
  }
}
