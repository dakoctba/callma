import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:callma/blocs/appointment.bloc.dart';
import 'package:callma/ui/android/scheduling/confirmation/partials/_cancellation_policy_card.view.dart';
import 'package:callma/ui/android/scheduling/confirmation/partials/_date_and_time_card.view.dart';
import 'package:callma/ui/android/scheduling/confirmation/partials/_notes_card.view.dart';
import 'package:callma/ui/android/scheduling/confirmation/partials/_receipt_card.view.dart';
import 'package:callma/ui/android/scheduling/details/partials/_address_card.view.dart';
import 'package:callma/ui/android/scheduling/details/partials/_clinics_card.view.dart';
import 'package:callma/ui/android/scheduling/details/partials/_header_card.view.dart';
import 'package:callma/ui/android/scheduling/professions/professions.view.dart';
import 'package:callma/ui/shared/custom_app_bar.dart';
import 'package:callma/ui/shared/custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:callma/ui/shared/custom_button.dart';
import 'package:callma/ui/shared/status.view.dart';
import 'package:farm/helpers.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class ConfirmationView extends StatefulWidget {
  @override
  _ConfirmationViewState createState() => _ConfirmationViewState();
}

class _ConfirmationViewState extends State<ConfirmationView> with DateHelper {
  AppointmentBloc appointmentBloc;

  @override
  void initState() {
    appointmentBloc = BlocProvider.getBloc<AppointmentBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar("Agendar consulta"),
        bottomNavigationBar: CustomBottomNavigationBar(),
        body: Container(
            padding: EdgeInsets.all(5),
            child: ListView(children: <Widget>[
              HeaderCardView(appointmentBloc.professional),
              DateAndTimeCardView(appointmentBloc.date),

              Consumer<AppointmentBloc>(
                distinct: (oldValue, newValue) =>
                    oldValue.clinicId != newValue.clinicId,
                builder: (_, AppointmentBloc valueBloc) {
                  Logger().d(
                      "Opa!!! A clínica selecionada agora é ${valueBloc?.clinicId}");
                  return Container();
                },
              ),
              appointmentBloc.address != null
                  ? AddressCardView(appointmentBloc.address)
                  : StreamBuilder<int>(
                      stream: appointmentBloc.clinicStream,
                      builder: (context, snapshot) {
                        return ClinicsCardView(
                            appointmentBloc.professional.clinics,
                            snapshot.hasData ? snapshot.data : null, (option) {
                          appointmentBloc.setClinicId(option);
                        });
                      }),
              // PatientCard(),
              // PaymentCard(),
              ReceiptCardView(),
              NotesCardView(),
              CancellationPolicyCardView(),
              SizedBox(height: 30),
              CustomButton("Agendar consulta", () {
                try {
                  _save(context);
                } catch (e) {
                  Logger().e(e);
                }
              })
            ])));
  }

  void _save(BuildContext context) async {
    bool askForClinicAddress = appointmentBloc.address == null &&
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
