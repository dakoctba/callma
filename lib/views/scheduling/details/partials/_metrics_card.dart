import 'package:callma/controllers/appointments_controller.dart';
import 'package:callma/models/professional.dart';
import 'package:callma/theme/application_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MetricsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appointmentsController = Provider.of<AppointmentsController>(context);

    return StreamBuilder<Professional>(
        stream: appointmentsController.professionalStream,
        builder: (context, AsyncSnapshot<Professional> snapshot) {
          if (!snapshot.hasData) {
            return Text("Carregando...");
          }

          return IntrinsicHeight(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "${snapshot.data.atendimentos}",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text('atendimentos')
                ],
              ),
              VerticalDivider(
                color: ApplicationStyle.PRIMARY_GREY,
              ),
              Column(
                children: <Widget>[
                  Text("${snapshot.data.stars}", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  Text('estrelas')
                ],
              ),
              VerticalDivider(color: ApplicationStyle.PRIMARY_GREY),
              Column(
                children: <Widget>[
                  Text("${snapshot.data.dias}", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  Text('dias conosco')
                ],
              ),
            ],
          ));
        });
  }
}
