import 'package:callma/blocs/appointment.bloc.dart';
import 'package:callma/ui/shared/custom_text.dart';
import 'package:callma/models/professional.dart';
import 'package:callma/models/specialty.dart';
import 'package:callma/themes/callma.theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SpecialtiesCard extends StatelessWidget {
  Container _buildSpecialty(Specialty specialty) {
    return Container(
        padding: EdgeInsets.only(bottom: 5),
        child: InkWell(
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.fiber_manual_record,
                  color: CallmaTheme.PRIMARY_GREEN,
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
    final bloc = Provider.of<AppointmentBloc>(context);

    Professional professional = bloc.professional;

    return Card(
        child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                CustomText(label: "Especialidades"),
                SizedBox(height: 20),
                Column(
                    children: professional.specialties
                        .map((specialty) => _buildSpecialty(specialty))
                        .toList())
              ],
            )));
  }
}
