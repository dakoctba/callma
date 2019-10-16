import 'package:callma/models/professional.dart';
import 'package:callma/themes/callma.theme.dart';
import 'package:flutter/material.dart';

class MetricsCardView extends StatelessWidget {
  final Professional professional;

  MetricsCardView(this.professional);

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
