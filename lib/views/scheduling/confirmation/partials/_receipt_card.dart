import 'package:callma/controllers/appointments_controller.dart';
import 'package:callma/library/custom_text.dart';
import 'package:callma/theme/application_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReceiptCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appointmentsController = Provider.of<AppointmentsController>(context);

    return Card(
      child: Container(
          padding: EdgeInsets.all(20),
          child: Row(
            children: <Widget>[
              Expanded(
                child: CustomText(label: "Quero o recibo médico"),
              ),
              StreamBuilder<bool>(
                stream: appointmentsController.receiptStream,
                builder: (context, AsyncSnapshot<bool> snapshot) {
                  if (snapshot.hasData) {
                    return Switch(
                        value: snapshot.data,
                        activeColor: ApplicationStyle.PRIMARY_GREEN,
                        inactiveTrackColor: ApplicationStyle.SECONDARY_GREY,
                        onChanged: (value) {
                          appointmentsController.setReceipt(value);
                        });
                  } else {
                    return Text("Carregando...");
                  }
                },
              )
            ],
          )),
    );
  }
}
