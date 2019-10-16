import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:callma/blocs/appointment.bloc.dart';
import 'package:flutter/material.dart';

class CancellationPolicyCardView extends StatefulWidget {
  @override
  _CancellationPolicyCardViewState createState() =>
      _CancellationPolicyCardViewState();
}

class _CancellationPolicyCardViewState
    extends State<CancellationPolicyCardView> {
  AppointmentBloc appointmentBloc;
  var option = false;

  @override
  void initState() {
    appointmentBloc = BlocProvider.getBloc<AppointmentBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          child: Row(
        children: <Widget>[
          Checkbox(
              value: appointmentBloc.cancellationPolicy,
              onChanged: (bool value) {
                setState(() {
                  option = value;
                });
                appointmentBloc.changeCancellationPolicy(value);
              }),
          Expanded(
            child: Text("Entendi a política de cancelamento"),
          ),
        ],
      )),
    );
  }
}
