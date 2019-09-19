import 'package:callma/models/professional.dart';
import 'package:callma/theme/application_style.dart';
import 'package:flutter/material.dart';

class ProfessionalDetailsMetrics extends StatelessWidget {
  final Professional professional;

  ProfessionalDetailsMetrics(this.professional);

  @override
  Widget build(BuildContext context) {
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
          color: ApplicationStyle.PRIMARY_GREY,
        ),
        Column(
          children: <Widget>[
            Text("${professional.stars}", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            Text('estrelas')
          ],
        ),
        VerticalDivider(color: ApplicationStyle.PRIMARY_GREY),
        Column(
          children: <Widget>[
            Text("${professional.dias}", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            Text('dias conosco')
          ],
        ),
      ],
    ));
  }
}
