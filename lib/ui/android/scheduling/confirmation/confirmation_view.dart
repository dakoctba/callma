import 'package:callma/blocs/appointment.bloc.dart';
import 'package:callma/ui/shared/custom_app_bar.dart';
import 'package:callma/ui/shared/custom_bottom_navigation_bar.dart';
import 'package:callma/ui/shared/custom_button.dart';
import 'package:callma/ui/shared/status_view.dart';
import 'package:callma/ui/android/scheduling/confirmation/partials/_cancellation_policy_card.dart';
import 'package:callma/ui/android/scheduling/confirmation/partials/_date_and_time_card.dart';
import 'package:callma/ui/android/scheduling/confirmation/partials/_notes_card.dart';
import 'package:callma/ui/android/scheduling/confirmation/partials/_patient_card.dart';
import 'package:callma/ui/android/scheduling/confirmation/partials/_payment_card.dart';
import 'package:callma/ui/android/scheduling/confirmation/partials/_receipt_card.dart';
import 'package:callma/ui/android/scheduling/details/partials/_address_card.dart';
import 'package:callma/ui/android/scheduling/details/partials/_header_card.dart';
import 'package:callma/ui/android/scheduling/professions/professions_view.dart';
import 'package:farm/helpers.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class ConfirmationView extends StatelessWidget with DateHelper {
  @override
  Widget build(BuildContext context) {
    final appointmentBloc = Provider.of<AppointmentBloc>(context);

    return Scaffold(
        appBar: CustomAppBar("Agendar consulta"),
        bottomNavigationBar: CustomBottomNavigationBar(),
        body: Container(
            padding: EdgeInsets.all(10),
            child: ListView(children: <Widget>[
              HeaderCard(),
              DateAndTimeCard(),
              appointmentBloc.addressId == null ? AddressCard() : Container(),
              PatientCard(),
              PaymentCard(),
              ReceiptCard(),
              NotesCard(),
              CancellationPolicyCard(),
              SizedBox(height: 30),
              CustomButton(
                  label: "Agendar consulta",
                  onPressed: () {
                    try {
                      _save(context);
                    } catch (e) {
                      Logger().e(e);
                    }
                  })
            ])));
  }

  void _save(BuildContext context) async {
    final appointmentBloc = Provider.of<AppointmentBloc>(context);

    bool askForClinicAddress = appointmentBloc.addressId == null &&
        appointmentBloc.professional.clinics.length > 1 &&
        appointmentBloc.clinicId == null;

    if (!appointmentBloc.cancellationPolicy) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Política de cancelamento"),
              content: Text(
                  "Você precisa aceitar a política de cancelamento para continuar."),
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
    } else if (askForClinicAddress) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Local de atendimento"),
              content:
                  Text("Você precisa selecionar um local para atendimento"),
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
    } else {
      await appointmentBloc.save();

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => StatusView("Consulta agendada com sucesso",
                      true, "Voltar para tela inicial", () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfessionsView()));
                  })));
    }
  }
}
