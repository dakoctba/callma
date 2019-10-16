import 'package:callma/models/professional.dart';
import 'package:callma/models/specialty.dart';
import 'package:callma/themes/callma.theme.dart';
import 'package:callma/ui/shared/custom_text.dart';
import 'package:flutter/material.dart';

class SpecialtiesCardView extends StatefulWidget {
  final Professional professional;

  SpecialtiesCardView(this.professional);

  @override
  _SpecialtiesCardViewState createState() =>
      _SpecialtiesCardViewState(this.professional);
}

class _SpecialtiesCardViewState extends State<SpecialtiesCardView> {
  final Professional professional;

  _SpecialtiesCardViewState(this.professional);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                CustomText("Especialidades"),
                SizedBox(height: 20),
                Column(
                    children: professional.specialties
                        .map((specialty) => _buildSpecialty(specialty))
                        .toList())
              ],
            )));
  }

  Container _buildSpecialty(Specialty specialty) {
    return Container(
        padding: EdgeInsets.only(bottom: 5),
        child: InkWell(
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.fiber_manual_record,
                  color: PRIMARY_GREEN,
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
}
