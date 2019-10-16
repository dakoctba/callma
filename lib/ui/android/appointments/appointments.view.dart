import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:callma/blocs/appointment.bloc.dart';
import 'package:callma/blocs/user.bloc.dart';
import 'package:callma/helpers/professionals_helper.dart';
import 'package:callma/models/appointment.dart';
import 'package:callma/themes/callma.theme.dart';
import 'package:callma/ui/android/appointments/appointment_details.view.dart';
import 'package:callma/ui/shared/badge.dart';
import 'package:callma/ui/shared/custom_app_bar.dart';
import 'package:callma/ui/shared/custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:callma/ui/shared/custom_loading.dart';
import 'package:farm/helpers.dart';
import 'package:flutter/material.dart';

class AppointmentsView extends StatefulWidget {
  @override
  _AppointmentsViewState createState() => _AppointmentsViewState();
}

class _AppointmentsViewState extends State<AppointmentsView> with DateHelper {
  UserBloc userBloc;
  var appointmentsController;

  @override
  void initState() {
    userBloc = BlocProvider.getBloc<UserBloc>();
    appointmentsController = BlocProvider.getBloc<AppointmentBloc>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    appointmentsController.getAppointments(userBloc.user.id);

    return Scaffold(
        appBar: CustomAppBar("Minhas consultas"),
        bottomNavigationBar: CustomBottomNavigationBar(),
        body: Container(
            padding: EdgeInsets.all(5),
            child: StreamBuilder<List<Appointment>>(
              stream: appointmentsController.appointmentsStream,
              builder: (context, AsyncSnapshot<List<Appointment>> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data.length == 0) {
                    return Center(
                        child: Text("Você ainda não fez nenhuma consulta"));
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
                      Icon(Icons.place, size: 16, color: PRIMARY_GREEN),
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
}
