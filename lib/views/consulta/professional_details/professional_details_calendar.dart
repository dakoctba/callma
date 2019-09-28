import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

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
                DatePickerTimeline(
                  DateTime.now(),
                  onDateChange: (date) {
                    // New date selected
                    print(date.day.toString());
                  },
                )
              ],
            )));
  }
}
