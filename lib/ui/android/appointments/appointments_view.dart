import 'package:callma/blocs/appointment.bloc.dart';
import 'package:callma/helpers/professionals_helper.dart';
import 'package:callma/ui/shared/badge.dart';
import 'package:callma/ui/shared/custom_app_bar.dart';
import 'package:callma/ui/shared/custom_bottom_navigation_bar.dart';
import 'package:callma/models/appointment.dart';
import 'package:callma/themes/callma.theme.dart';
import 'package:callma/ui/android/appointments/appointment_details_view.dart';
import 'package:callma/ui/shared/custom_loading.dart';
import 'package:farm/helpers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppointmentsView extends StatelessWidget with DateHelper {
  Widget _buildCard(BuildContext context, Appointment appointment) {
    return InkWell(
        child: Card(
            child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Row(children: <Widget>[
                      CircleAvatar(
                        backgroundImage: ProfessionalsHelper.getPhoto(
                            appointment.professional.photo),
                        backgroundColor: Colors.transparent,
                        radius: 20,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                            Text(appointment.professional.name,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(appointment.professional.profession.title,
                                style: TextStyle(color: PRIMARY_GREY))
                          ]))
                    ]),
                    SizedBox(height: 20),
                    Row(children: <Widget>[
                      Icon(Icons.calendar_today,
                          size: 16, color: PRIMARY_GREEN),
                      SizedBox(width: 10),
                      Expanded(child: Text(formatDate(appointment.schedule)))
                    ]),
                    SizedBox(height: 5),
                    Row(children: <Widget>[
                      Icon(Icons.pin_drop, size: 16, color: PRIMARY_GREEN),
                      SizedBox(width: 10),
                      Expanded(
                          child:
                              Text(appointment.professional.clinics[0].address))
                    ]),
                    SizedBox(height: 5),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                              child: Row(children: <Widget>[
                            Icon(Icons.attach_money,
                                size: 16, color: PRIMARY_GREEN),
                            SizedBox(width: 10),
                            Expanded(
                                child: Text(
                                    "R\$ ${appointment.price.toStringAsFixed(2)}"))
                          ])),
                        ),
                        Badge(status: appointment.status)
                      ],
                    )
                  ],
                ))),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AppointmentDetailsView(appointment)));
        });
  }

  @override
  Widget build(BuildContext context) {
    final appointmentsController = Provider.of<AppointmentBloc>(context);
    appointmentsController.getAppointments(1); // TODO: HARDCODE

    return Scaffold(
        appBar: CustomAppBar(title: "Minhas consultas"),
        bottomNavigationBar: CustomBottomNavigationBar(),
        body: Container(
            padding: EdgeInsets.all(10),
            child: StreamBuilder<List<Appointment>>(
              stream: appointmentsController.appointmentsStream,
              builder: (context, AsyncSnapshot<List<Appointment>> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data.length == 0) {
                    return Text("Você ainda não fez nenhuma consulta");
                  }

                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return _buildCard(context, snapshot.data[index]);
                      });
                } else {
                  return CustomLoading("Carregando consultas");
                }
              },
            )));
  }
}
