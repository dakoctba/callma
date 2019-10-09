import 'package:callma/controllers/appointments_controller.dart';
import 'package:callma/library/custom_app_bar.dart';
import 'package:callma/library/custom_bottom_navigation_bar.dart';
import 'package:callma/library/custom_button.dart';
import 'package:callma/views/scheduling/confirmation/partials/_cancellation_policy_card.dart';
import 'package:callma/views/scheduling/confirmation/partials/_date_and_time_card.dart';
import 'package:callma/views/scheduling/confirmation/partials/_notes_card.dart';
import 'package:callma/views/scheduling/confirmation/partials/_patient_card.dart';
import 'package:callma/views/scheduling/confirmation/partials/_payment_card.dart';
import 'package:callma/views/scheduling/confirmation/partials/_receipt_card.dart';
import 'package:callma/views/scheduling/details/professional_details_address.dart';
import 'package:callma/views/scheduling/details/professional_details_header.dart';
import 'package:farm/helpers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfirmationView extends StatelessWidget with DateHelper {
  final DateTime _visitDate;

  ConfirmationView(this._visitDate);

  _save(BuildContext context) async {
    final appointmentsController = Provider.of<AppointmentsController>(context);

    //
    // Saving...
    //
    if (!appointmentsController.cancellationPolicy) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Política de cancelamento"),
              content: Text("Você precisa aceitar a política de cancelamento para continuar."),
              actions: <Widget>[
                FlatButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            );
          });
      return;
    }

    await appointmentsController.save(this._visitDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: "Agendar consulta"),
        bottomNavigationBar: CustomBottomNavigationBar(CustomBottomNavigationBar.HOME_OPTION),
        body: Container(
            padding: EdgeInsets.all(10),
            child: ListView(children: <Widget>[
              ProfessionalDetailsHeader(),
              DateAndTimeCard(_visitDate),
              ProfessionalDetailsAddress(),
              PatientCard(),
              PaymentCard(),
              ReceiptCard(),
              NotesCard(),
              CancellationPolicyCard(),
              SizedBox(height: 30),
              CustomButton(
                  label: "Agendar consulta",
                  onPressed: () async {
                    try {
                      _save(context);

                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) =>
                      //         StatusView("Consulta agendada com sucesso", true, "Voltar para tela inicial", () {
                      //           Navigator.of(context)
                      //               .pushReplacement(MaterialPageRoute(builder: (context) => ProfessionsView()));
                      //         })));
                    } catch (e) {
                      print(e);
                    }
                  })
            ])));
  }
}
