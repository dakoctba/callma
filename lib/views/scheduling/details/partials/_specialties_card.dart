import 'package:callma/controllers/appointments_controller.dart';
import 'package:callma/library/custom_text.dart';
import 'package:callma/models/professional.dart';
import 'package:callma/models/specialty.dart';
import 'package:callma/theme/application_style.dart';
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
    final appointmentsController = Provider.of<AppointmentsController>(context);

    return StreamBuilder<Professional>(
        stream: appointmentsController.professionalStream,
        builder: (context, AsyncSnapshot<Professional> snapshot) {
          if (!snapshot.hasData) {
            return Text("Carregando...");
          }

          return Card(
              child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      CustomText(label: "Especialidades"),
                      SizedBox(height: 20),
                      Column(
                          children: snapshot.data.specialties.map((specialty) => _buildSpecialty(specialty)).toList())
                    ],
                  )));
        });
  }
}
