import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:callma/blocs/appointment.bloc.dart';
import 'package:callma/ui/android/scheduling/confirmation/confirmation.view.dart';
import 'package:callma/ui/shared/custom_text.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CalendarCardView extends StatefulWidget {
  @override
  _CalendarCardViewState createState() => _CalendarCardViewState();
}

class _CalendarCardViewState extends State<CalendarCardView> {
  AppointmentBloc appointmentBloc;

  @override
  void initState() {
    appointmentBloc = BlocProvider.getBloc<AppointmentBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CustomText("Escolha uma data"),
                SizedBox(height: 20),
                DatePickerTimeline(
                  DateTime.now(),
                  onDateChange: (date) {
                    appointmentBloc.setDate(date);
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
