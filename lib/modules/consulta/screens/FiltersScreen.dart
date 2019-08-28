import 'package:callma/components/CallmaColors.dart';
import 'package:callma/components/bars/CallmaAppBar.dart';
import 'package:callma/components/bars/CallmaBottomNavigationBar.dart';
import 'package:callma/components/buttons/CallmaButton.dart';
import 'package:callma/components/switchs/CallmaSwitchListTile.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {

  double distancia = 10;
  double horarioInicio = 8;
  double horarioFim = 17;

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
              Text("Horário da consulta (${horarioInicio.toInt()}:00 - ${horarioFim.toInt()}:00)", style: TextStyle(fontWeight: FontWeight.bold)),
              RangeSlider(
                  values: RangeValues(horarioInicio, horarioFim),
                  min: 1.0,
                  max: 24.0,
                  labels: RangeLabels("${horarioInicio.toInt()}:00", "${horarioFim.toInt()}:00"),
                  activeColor: CallmaColors.VERDE_ESCURO,
                  inactiveColor: CallmaColors.BACKGROUND_COLOR,
                  onChanged: (RangeValues values) {
                    setState(() {
                      horarioInicio = values.start;
                      horarioFim = values.end;
                    });
                  },
                  divisions: 24,
                  semanticFormatterCallback: (RangeValues values) {
                    return '${horarioInicio.toInt()}:00 - ${horarioFim.toInt()}:00';
                  }
              ),
              Text("Distância (${distancia.toInt()} km)", style: TextStyle(fontWeight: FontWeight.bold)),
              Slider(
                  value: distancia,
                  min: 1.0,
                  max: 100.0,
                  label: "${distancia.toInt()} km",
                  activeColor: CallmaColors.VERDE_ESCURO,
                  inactiveColor: CallmaColors.BACKGROUND_COLOR,
                  onChanged: (double value) {
                    setState(() {
                      distancia = value;
                    });
                  },
                  divisions: 100,
              ),
              Padding(
                  padding: EdgeInsets.all(20.0),
                  child: CallmaButton("Filtrar resultado")
              )
            ],
          ),
        )
    );
  }
}