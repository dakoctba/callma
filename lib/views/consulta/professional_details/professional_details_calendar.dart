import 'package:callma/helpers/application_helper.dart';
import 'package:callma/library/custom_button.dart';
import 'package:callma/theme/application_style.dart';
import 'package:flutter/material.dart';

import 'package:callma/library/custom_text.dart';
import 'package:flutter/rendering.dart';

class ProfessionalDetailsCalendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CustomText(label: "Agendamento"),
                SizedBox(height: 20),
                Container(
                  height: 150,
                  child: ListView.builder(
                      itemCount: 90,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return ScheduleCard(data: DateTime.now().add(Duration(days: index)));
                      }),
                )
              ],
            )));
  }
}

class ScheduleCard extends StatelessWidget {
  final DateTime data;

  ScheduleCard({@required this.data});

  static _launchSchedule(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Sobre o aplicativo"),
            content: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                            side: BorderSide(color: ApplicationStyle.SECONDARY_GREEN)),
                        color: Colors.white,
                        textColor: ApplicationStyle.SECONDARY_GREEN,
                        onPressed: () {},
                        child: Text("08:00")),
                    RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                            side: BorderSide(color: ApplicationStyle.SECONDARY_GREEN)),
                        color: Colors.white,
                        textColor: ApplicationStyle.SECONDARY_GREEN,
                        onPressed: () {},
                        child: Text("09:00")),
                    RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                            side: BorderSide(color: ApplicationStyle.SECONDARY_GREEN)),
                        color: Colors.white,
                        textColor: ApplicationStyle.SECONDARY_GREEN,
                        onPressed: () {},
                        child: Text("10:00"))
                  ],
                ),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("Agendar consulta"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
            padding: EdgeInsets.all(20),
            child: Column(children: <Widget>[
              Text(
                ApplicationHelper.formatDate(data),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(ApplicationHelper.formatDateToWeekDay(data)),
              SizedBox(height: 20),
              RaisedButton(
                child: Text("Ver horários"),
                onPressed: () {
                  _launchSchedule(context);
                },
              )
            ])));
  }
}
