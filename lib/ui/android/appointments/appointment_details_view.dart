import 'package:callma/ui/shared/custom_app_bar.dart';
import 'package:callma/ui/shared/custom_bottom_navigation_bar.dart';
import 'package:callma/models/appointment.dart';
import 'package:flutter/material.dart';

class AppointmentDetailsView extends StatelessWidget {
  final Appointment _appointment;

  AppointmentDetailsView(this._appointment);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar("Detalhes da consulta"),
        bottomNavigationBar: CustomBottomNavigationBar(),
        body: Container(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Card(
                    child: Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[Text(_appointment.notes)],
                        )))
              ],
            )));
  }
}
