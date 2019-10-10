import 'package:callma/controllers/appointments_controller.dart';
import 'package:flutter/material.dart';
import 'package:farm/helpers.dart';

import 'package:callma/library/custom_text.dart';
import 'package:provider/provider.dart';

class DateAndTimeCard extends StatelessWidget with DateHelper {
  @override
  Widget build(BuildContext context) {
    final appointmentsController = Provider.of<AppointmentsController>(context);

    return Card(
      child: Container(
        padding: EdgeInsets.all(20),
        child: StreamBuilder<DateTime>(
            stream: appointmentsController.dateStream,
            builder: (context, AsyncSnapshot<DateTime> snapshot) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: CustomText(label: "Data da consulta"),
                      ),
                      Text(snapshot.data == null ? "" : formatDate(snapshot.data))
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: CustomText(label: "Horário da consulta"),
                      ),
                      Text(snapshot.data == null ? "" : formatDate(snapshot.data))
                    ],
                  ),
                ],
              );
            }),
      ),
    );
  }
}
