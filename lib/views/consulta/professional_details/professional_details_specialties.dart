import 'package:callma/library/custom_text.dart';
import 'package:flutter/material.dart';

class ProfessionalDetailsSpecialties extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[CustomText(label: "Especialidades")],
      ),
    );
  }
}
