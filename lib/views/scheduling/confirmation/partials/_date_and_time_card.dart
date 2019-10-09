import 'package:flutter/material.dart';
import 'package:farm/helpers.dart';

import 'package:callma/library/custom_text.dart';

class DateAndTimeCard extends StatelessWidget with DateHelper {
  final DateTime visitDate;

  const DateAndTimeCard(this.visitDate);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: CustomText(label: "Data da consulta"),
                ),
                Text(formatDate(visitDate))
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: <Widget>[
                Expanded(
                  child: CustomText(label: "Horário da consulta"),
                ),
                Text(formatDate(visitDate))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
