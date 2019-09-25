import 'package:callma/library/custom_text.dart';
import 'package:callma/theme/application_style.dart';
import 'package:flutter/material.dart';

class ProfessionalDetailsSpecialties extends StatelessWidget {
  final List<String> specialties = ["Especialidade 1", "Espec. 2", "Espec. 3"];

  Container _buildSpecialty(String title) {
    return Container(
        padding: EdgeInsets.only(bottom: 5),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.fiber_manual_record,
              color: ApplicationStyle.PRIMARY_GREEN,
              size: 14,
            ),
            SizedBox(width: 10),
            Text(title)
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                CustomText(label: "Especialidades"),
                SizedBox(height: 20),
                Column(children: specialties.map((item) => _buildSpecialty(item)).toList())
              ],
            )));
  }
}
