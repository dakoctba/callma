import 'package:callma/library/custom_text.dart';
import 'package:flutter/material.dart';

class ProfessionalDetailsAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          CustomText(label: "Endereço do consultório"),
          SizedBox(height: 10),
          Text("Rua Padre Anchieta, 1846"),
          Text("Bigorrilho"),
          Text("Curitiba - PR")
        ],
      ),
    );
  }
}
