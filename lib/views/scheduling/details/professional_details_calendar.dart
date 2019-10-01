import 'package:callma/models/professional.dart';
import 'package:callma/views/scheduling/confirmation/confirmation_view.dart';
import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

import 'package:callma/library/custom_text.dart';
import 'package:flutter/rendering.dart';

class ProfessionalDetailsCalendar extends StatelessWidget {
  final Professional _professional;

  ProfessionalDetailsCalendar(this._professional);

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
                DatePickerTimeline(
                  DateTime.now(),
                  onDateChange: (date) {
                    print(date.day.toString());
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => ConfirmationView(_professional, date)));
                  },
                )
              ],
            )));
  }
}
