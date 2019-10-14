import 'package:callma/blocs/appointment.bloc.dart';
import 'package:callma/ui/shared/custom_text.dart';
import 'package:farm/helpers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DateAndTimeCard extends StatelessWidget with DateHelper {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<AppointmentBloc>(context);

    return Card(
      child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: CustomText(label: "Data da consulta"),
                  ),
                  Text(bloc.date == null ? "" : formatDate(bloc.date))
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: <Widget>[
                  Expanded(
                    child: CustomText(label: "Horário da consulta"),
                  ),
                  Text(bloc.date == null ? "" : formatDate(bloc.date))
                ],
              ),
            ],
          )),
    );
  }
}
