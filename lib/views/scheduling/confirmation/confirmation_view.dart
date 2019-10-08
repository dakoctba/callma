import 'package:callma/controllers/appointments_controller.dart';
import 'package:callma/library/custom_app_bar.dart';
import 'package:callma/library/custom_bottom_navigation_bar.dart';
import 'package:callma/library/custom_button.dart';
import 'package:callma/library/custom_text.dart';
import 'package:callma/library/status_view.dart';
import 'package:callma/models/professional.dart';
import 'package:callma/store/ApplicationStore.dart';
import 'package:callma/theme/application_style.dart';
import 'package:callma/views/scheduling/details/professional_details_address.dart';
import 'package:callma/views/scheduling/details/professional_details_header.dart';
import 'package:callma/views/scheduling/professions/professions_view.dart';
import 'package:farm/helpers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ConfirmationView extends StatelessWidget with DateHelper {
  final Professional _professional;
  final DateTime _visitDate;

  ConfirmationView(this._professional, this._visitDate);

  _visitDateAndTime() {
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
                Text(formatDate(_visitDate))
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: <Widget>[
                Expanded(
                  child: CustomText(label: "Horário da consulta"),
                ),
                Text(formatDate(_visitDate))
              ],
            ),
          ],
        ),
      ),
    );
  }

  _visitPatient(BuildContext context) {
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
                  child: CustomText(label: "Paciente"),
                ),
                SizedBox(
                  height: 20,
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0),
                          side: BorderSide(color: ApplicationStyle.SECONDARY_GREEN)),
                      color: Colors.white,
                      textColor: ApplicationStyle.SECONDARY_GREEN,
                      onPressed: () {},
                      child: Text("Alterar")),
                )
              ],
            ),
            SizedBox(height: 20),
            Text("John Doe")
          ],
        ),
      ),
    );
  }

  _visitPayment() {
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
                  child: CustomText(label: "Método de pagamento"),
                ),
                SizedBox(
                  height: 20,
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0),
                          side: BorderSide(color: ApplicationStyle.SECONDARY_GREEN)),
                      color: Colors.white,
                      textColor: ApplicationStyle.SECONDARY_GREEN,
                      onPressed: () {},
                      child: Text("Alterar")),
                )
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: <Widget>[Icon(FontAwesomeIcons.ccVisa), SizedBox(width: 10), Text("**** **** **** 1234")],
            )
          ],
        ),
      ),
    );
  }

  _visitTicket() {
    return Card(
      child: Container(
          padding: EdgeInsets.all(20),
          child: Row(
            children: <Widget>[
              Expanded(
                child: CustomText(label: "Quero o recibo médico"),
              ),
              Switch(
                value: false,
                activeColor: ApplicationStyle.PRIMARY_GREEN,
                inactiveTrackColor: ApplicationStyle.SECONDARY_GREY,
                onChanged: (bool value) {},
              )
            ],
          )),
    );
  }

  _visitObservations() {
    return Card(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            CustomText(label: "Observações ao profissional"),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(border: OutlineInputBorder()),
              maxLines: 3,
            )
          ],
        ),
      ),
    );
  }

  _visitCancellationPolicy() {
    return Card(
      child: Container(
          child: Row(
        children: <Widget>[
          Checkbox(value: false, onChanged: (bool value) {}),
          Expanded(
            child: Text("Entendi a política de cancelamento"),
          ),
        ],
      )),
    );
  }

  _save(BuildContext context) async {
    final appointmentsController = Provider.of<AppointmentsController>(context);
    final applicationStore = Provider.of<ApplicationStore>(context);

    //
    // Saving...
    //
    Map<String, dynamic> params = new Map<String, dynamic>();

    params['professional_id'] = 1;
    params['profile_id'] = applicationStore.user.profiles[0].id;
    params['receipt'] = false;
    params['payment_status'] = 'confirmed';
    params['notes'] = 'Salvo pelo flutter';
    params['status'] = 'scheduled';
    params['schedule'] = formatDateToBd(DateTime.now());
    params['address_id'] = 52;
    params['price'] = 145.0;
    params['clinic_id'] = 140;

    await appointmentsController.save(params);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: "Agendar consulta"),
        bottomNavigationBar: CustomBottomNavigationBar(CustomBottomNavigationBar.HOME_OPTION),
        body: Container(
            padding: EdgeInsets.all(10),
            child: ListView(children: <Widget>[
              ProfessionalDetailsHeader(_professional),
              _visitDateAndTime(),
              ProfessionalDetailsAddress(_professional.clinics),
              _visitPatient(context),
              _visitPayment(),
              _visitTicket(),
              _visitObservations(),
              _visitCancellationPolicy(),
              SizedBox(height: 30),
              CustomButton(
                  label: "Agendar consulta",
                  onPressed: () async {
                    try {
                      _save(context);

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              StatusView("Consulta agendada com sucesso", true, "Voltar para tela inicial", () {
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(builder: (context) => ProfessionsView()));
                              })));
                    } catch (e) {
                      print(e);
                    }
                  })
            ])));
  }
}
