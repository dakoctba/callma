import 'package:callma/controllers/appointments_controller.dart';
import 'package:callma/library/custom_text.dart';
import 'package:callma/models/professional.dart';
import 'package:callma/theme/application_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfessionalDetailsAddress extends StatelessWidget {
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
                      CustomText(label: "Endereço do consultório"),
                      SizedBox(height: 10),
                      ListView.separated(
                        itemCount: snapshot.data.clinics.length,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Text(snapshot.data.clinics[index].address),
                              Text(
                                  "${snapshot.data.clinics[index].district} - ${snapshot.data.clinics[index].city}/ ${snapshot.data.clinics[index].state}"),
                              Text(snapshot.data.clinics[index].zipcode),
                            ],
                          );
                        },
                        separatorBuilder: (context, index) =>
                            Divider(color: ApplicationStyle.SECONDARY_GREY, height: 20),
                      )
                    ],
                  )));
        });
  }
}
