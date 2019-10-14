import 'package:callma/blocs/appointment.bloc.dart';
import 'package:callma/models/professional.dart';
import 'package:callma/themes/callma.theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MetricsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<AppointmentBloc>(context);

    Professional professional = bloc.professional;

    return IntrinsicHeight(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Column(
          children: <Widget>[
            Text(
              "${professional.atendimentos}",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text('atendimentos')
          ],
        ),
        VerticalDivider(
          color: PRIMARY_GREY,
        ),
        Column(
          children: <Widget>[
            Text("${professional.stars}",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            Text('estrelas')
          ],
        ),
        VerticalDivider(color: PRIMARY_GREY),
        Column(
          children: <Widget>[
            Text("${professional.dias}",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            Text('dias conosco')
          ],
        ),
      ],
    ));
  }
}
