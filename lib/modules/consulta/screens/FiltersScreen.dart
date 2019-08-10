import 'package:callma/components/CallmaColors.dart';
import 'package:callma/components/bars/CallmaAppBar.dart';
import 'package:callma/components/bars/CallmaBottomNavigationBar.dart';
import 'package:callma/components/switchs/CallmaSwitchListTile.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  int _value = 6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CallmaAppBar("Filtros"),
        bottomNavigationBar: CallmaBottomNavigationBar(CallmaBottomNavigationBar.HOME_OPTION),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: ListView(
            children: <Widget>[
              Text("Valor máximo", style: TextStyle(fontWeight: FontWeight.bold)),
              CallmaSwitchListTile("Qualquer valor"),
              Text("Data da consulta", style: TextStyle(fontWeight: FontWeight.bold)),
              CallmaSwitchListTile("Qualquer data"),
              Text("Horário da consulta", style: TextStyle(fontWeight: FontWeight.bold)),
              Slider(
                  value: _value.toDouble(),
                  min: 0.0,
                  max: 24.0,
                  divisions: 24,
                  activeColor: CallmaColors.VERDE_ESCURO,
                  inactiveColor: CallmaColors.BACKGROUND_COLOR,
                  label: '$_value',
                  onChanged: (double newValue) {
                    setState(() {
                      _value = newValue.round();
                    });
                  },
                  semanticFormatterCallback: (double newValue) {
                    return '${newValue.round()} dollars';
                  }
              )
            ],
          ),
        )
    );
  }
}