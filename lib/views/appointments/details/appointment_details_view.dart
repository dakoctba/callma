import 'package:callma/library/custom_app_bar.dart';
import 'package:callma/library/custom_bottom_navigation_bar.dart';
import 'package:callma/models/appointment.dart';
import 'package:flutter/material.dart';

class AppointmentDetailsView extends StatelessWidget {
  final Appointment _appointment;

  AppointmentDetailsView(this._appointment);

  _body() {
    return Card(
        child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[Text(_appointment.notes)],
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: "Detalhes da consulta"),
        bottomNavigationBar: CustomBottomNavigationBar(CustomBottomNavigationBar.LIST_OPTION),
        body: Container(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[_body()],
            )));
  }
}