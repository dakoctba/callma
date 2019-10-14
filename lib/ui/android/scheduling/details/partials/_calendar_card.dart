import 'package:callma/blocs/appointment.bloc.dart';
import 'package:callma/ui/shared/custom_text.dart';
import 'package:callma/ui/android/scheduling/confirmation/confirmation_view.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class CalendarCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<AppointmentBloc>(context);

    return Card(
        child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CustomText(label: "Escolha uma data"),
                SizedBox(height: 20),
                DatePickerTimeline(
                  DateTime.now(),
                  onDateChange: (date) {
                    bloc.setDate(date);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ConfirmationView()));
                  },
                )
              ],
            )));
  }
}
