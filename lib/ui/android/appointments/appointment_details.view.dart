import 'package:callma/enumerations/appointment_status.dart';
import 'package:callma/models/appointment.dart';
import 'package:callma/themes/callma.theme.dart';
import 'package:callma/ui/android/appointments/appointments.view.dart';
import 'package:callma/ui/android/help/webview.view.dart';
import 'package:callma/ui/android/scheduling/confirmation/partials/_date_and_time_card.view.dart';
import 'package:callma/ui/android/scheduling/details/partials/_clinics_card.view.dart';
import 'package:callma/ui/android/scheduling/details/partials/_header_card.view.dart';
import 'package:callma/ui/android/scheduling/details/partials/_specialties_card.dart';
import 'package:callma/ui/shared/custom_app_bar.dart';
import 'package:callma/ui/shared/custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:callma/ui/shared/custom_button.dart';
import 'package:callma/ui/shared/custom_text.dart';
import 'package:callma/ui/shared/status.view.dart';
import 'package:flutter/material.dart';

class AppointmentDetailsView extends StatefulWidget {
  final Appointment _appointment;

  AppointmentDetailsView(this._appointment);

  @override
  _AppointmentDetailsViewState createState() =>
      _AppointmentDetailsViewState(_appointment);
}

class _AppointmentDetailsViewState extends State<AppointmentDetailsView> {
  final Appointment _appointment;
  final String URL_POLITICA_CANCELAMENTO =
      "https://callma.com.br/politica-cancelamento";

  _AppointmentDetailsViewState(this._appointment);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar("Detalhes da consulta"),
        bottomNavigationBar: CustomBottomNavigationBar(),
        body: Column(
          children: <Widget>[
            _buildTopLabel(_appointment.status),
            Expanded(
                child: Container(
              padding: EdgeInsets.all(5),
              child: ListView(
                children: <Widget>[
                  HeaderCardView(_appointment.professional),
                  SpecialtiesCard(_appointment.professional),
                  DateAndTimeCardView(_appointment.schedule),
                  _appointment.address == null
                      ? ClinicsCardView(
                          _appointment.professional.clinics, null, (_) {})
                      : Container(),
                  _buildReceiptCard(_appointment.receipt),
                  _buildNotesCard(_appointment.notes),
                  _buildCancelButton(_appointment),
                  SizedBox(height: 10)
                ],
              ),
            )),
          ],
        ));
  }

  Container _buildTopLabel(AppointmentStatus status) {
    Color backgroundColor;
    Color textColor;
    String text;

    switch (status) {
      case AppointmentStatus.done:
        text = "Consulta realizada";
        backgroundColor = TERTIARY_GREY;
        textColor = PRIMARY_GREY;
        break;
      case AppointmentStatus.scheduled:
        text = "Consulta agendada";
        backgroundColor = SECONDARY_GREEN;
        textColor = Colors.white;
        break;
      case AppointmentStatus.canceled:
        text = "Consulta cancelada";
        backgroundColor = PRIMARY_RED;
        textColor = Colors.white;
    }

    return Container(
      height: 40,
      color: backgroundColor,
      child: Center(
        child: Text(text, style: TextStyle(color: textColor)),
      ),
    );
  }

  Card _buildReceiptCard(bool receipt) {
    return Card(
      child: Container(
          padding: EdgeInsets.all(20),
          child: Row(
            children: <Widget>[
              Expanded(
                child: CustomText("Recibo médico"),
              ),
              Text(receipt ? "Sim" : "Não")
            ],
          )),
    );
  }

  Card _buildNotesCard(String notes) {
    return Card(
      child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              CustomText("Observações ao profissional"),
              SizedBox(height: 10),
              Text(notes)
            ],
          )),
    );
  }

  Widget _buildCancelButton(Appointment appointment) {
    if (appointment.status == AppointmentStatus.scheduled) {
      return Column(
        children: <Widget>[
          CustomButton("Cancelar consulta", () async {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => StatusView(
                            "Consulta cancelada com sucesso",
                            true,
                            "Voltar para a listagem", () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AppointmentsView()));
                        })));
          }, success: false),
          InkWell(
            child: Text(
              "Política de cancelamento",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12),
            ),
            onTap: () {
              Navigator.push(
                  (context),
                  MaterialPageRoute(
                      builder: (context) =>
                          WebviewView(URL_POLITICA_CANCELAMENTO)));
            },
          ),
        ],
      );
    }

    return Container();
  }
}
