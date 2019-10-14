import 'package:callma/blocs/appointment.bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CancellationPolicyCard extends StatefulWidget {
  @override
  _CancellationPolicyCardState createState() => _CancellationPolicyCardState();
}

class _CancellationPolicyCardState extends State<CancellationPolicyCard> {
  var option = false;

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<AppointmentBloc>(context);

    return Card(
      child: Container(
          child: Row(
        children: <Widget>[
          Checkbox(
              value: bloc.cancellationPolicy,
              onChanged: (bool value) {
                setState(() {
                  option = value;
                });
                bloc.changeCancellationPolicy(value);
              }),
          Expanded(
            child: Text("Entendi a política de cancelamento"),
          ),
        ],
      )),
    );
  }
}
