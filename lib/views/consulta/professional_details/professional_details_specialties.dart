import 'package:callma/library/custom_text.dart';
import 'package:callma/models/specialty.dart';
import 'package:callma/theme/application_style.dart';
import 'package:flutter/material.dart';

class ProfessionalDetailsSpecialties extends StatelessWidget {
  final List<Specialty> _specialties;

  ProfessionalDetailsSpecialties(this._specialties);

  Container _buildSpecialty(Specialty specialty) {
    return Container(
        padding: EdgeInsets.only(bottom: 5),
        child: InkWell(
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.fiber_manual_record,
                  color: ApplicationStyle.PRIMARY_GREEN,
                  size: 14,
                ),
                SizedBox(width: 10),
                Text(specialty.title)
              ],
            ),
            onTap: () {
              debugPrint("Clicou em um item");
            }));
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
                Column(children: _specialties.map((specialty) => _buildSpecialty(specialty)).toList())
              ],
            )));
  }
}
