import 'package:callma/theme/application_style.dart';
import 'package:callma/library/custom_app_bar.dart';
import 'package:callma/library/custom_bottom_navigation_bar.dart';
import 'package:callma/library/custom_button.dart';
import 'package:callma/library/custom_switch_list_tile.dart';
import 'package:callma/views/consulta/professionals/professionals_view.dart';
import 'package:flutter/material.dart';

class FiltersView extends StatefulWidget {
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersView> {
  double distancia = 10;
  double horarioInicio = 8;
  double horarioFim = 17;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: "Filtros"),
        bottomNavigationBar: CustomBottomNavigationBar(CustomBottomNavigationBar.HOME_OPTION),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: ListView(
            children: <Widget>[
              Text("Valor máximo", style: TextStyle(fontWeight: FontWeight.bold)),
              CustomSwitchListTile("Qualquer valor"),
              Text("Data da consulta", style: TextStyle(fontWeight: FontWeight.bold)),
              CustomSwitchListTile("Qualquer data"),
              Text("Horário da consulta (${horarioInicio.toInt()}:00 - ${horarioFim.toInt()}:00)",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              RangeSlider(
                  values: RangeValues(horarioInicio, horarioFim),
                  min: 1.0,
                  max: 24.0,
                  labels: RangeLabels("${horarioInicio.toInt()}:00", "${horarioFim.toInt()}:00"),
                  activeColor: ApplicationStyle.SECONDARY_GREEN,
                  inactiveColor: ApplicationStyle.PRIMARY_GREEN,
                  onChanged: (RangeValues values) {
                    setState(() {
                      horarioInicio = values.start;
                      horarioFim = values.end;
                    });
                  },
                  divisions: 24,
                  semanticFormatterCallback: (RangeValues values) {
                    return '${horarioInicio.toInt()}:00 - ${horarioFim.toInt()}:00';
                  }),
              Text("Distância (${distancia.toInt()} km)", style: TextStyle(fontWeight: FontWeight.bold)),
              Slider(
                value: distancia,
                min: 1.0,
                max: 100.0,
                label: "${distancia.toInt()} km",
                activeColor: ApplicationStyle.SECONDARY_GREEN,
                inactiveColor: ApplicationStyle.PRIMARY_GREEN,
                onChanged: (double value) {
                  setState(() {
                    distancia = value;
                  });
                },
                divisions: 100,
              ),
              Padding(
                  padding: EdgeInsets.all(20.0),
                  child: CustomButton(
                      label: "Filtrar resultado",
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfessionalsView(0)));
                      }))
            ],
          ),
        ));
  }
}
