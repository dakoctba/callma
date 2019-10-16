import 'package:callma/ui/shared/custom_text.dart';
import 'package:farm/helpers.dart';
import 'package:flutter/material.dart';

class DateAndTimeCardView extends StatefulWidget {
  final DateTime _date;

  DateAndTimeCardView(this._date);

  @override
  _DateAndTimeCardViewState createState() =>
      _DateAndTimeCardViewState(this._date);
}

class _DateAndTimeCardViewState extends State<DateAndTimeCardView>
    with DateHelper {
  final DateTime _date;

  _DateAndTimeCardViewState(this._date);

  @override
  void initState() {
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
              Row(
                children: <Widget>[
                  Expanded(
                    child: CustomText("Data da consulta"),
                  ),
                  Text(_date == null ? "" : formatDate(_date))
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: <Widget>[
                  Expanded(
                    child: CustomText("Horário da consulta"),
                  ),
                  Text(_date == null ? "" : formatDate(_date))
                ],
              ),
            ],
          )),
    );
  }
}
