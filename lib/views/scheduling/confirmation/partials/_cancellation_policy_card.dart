import 'package:callma/controllers/appointments_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CancellationPolicyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appointmentsController = Provider.of<AppointmentsController>(context);

    return Card(
      child: Container(
          child: Row(
        children: <Widget>[
          StreamBuilder<bool>(
            stream: appointmentsController.cancellationPolicyStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Checkbox(
                    value: snapshot.data,
                    onChanged: (bool value) {
                      appointmentsController.setCancellationPolicy(value);
                    });
              } else {
                return Text("Carregando...");
              }
            },
          ),
          Expanded(
            child: Text("Entendi a política de cancelamento"),
          ),
        ],
      )),
    );
  }
}
