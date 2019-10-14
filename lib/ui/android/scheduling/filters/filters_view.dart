import 'package:callma/ui/shared/custom_text.dart';
import 'package:callma/themes/callma.theme.dart';
import 'package:callma/ui/shared/custom_app_bar.dart';
import 'package:callma/ui/shared/custom_bottom_navigation_bar.dart';
import 'package:callma/ui/shared/custom_button.dart';
import 'package:callma/ui/android/scheduling/professionals/professionals_view.dart';
import 'package:flutter/material.dart';

class FiltersView extends StatefulWidget {
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersView> {
  double distancia = 10;
  double horarioInicio = 8;
  double horarioFim = 17;
  double valor = 500;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: "Filtros"),
        bottomNavigationBar: CustomBottomNavigationBar(),
        body: Container(
          padding: EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              Card(
                child: Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        Row(children: <Widget>[
                          Expanded(child: CustomText(label: "Valor máximo")),
                          Text("R\$ ${valor.toStringAsFixed(2)}")
                        ]),
                        SizedBox(height: 10),
                        Slider(
                          value: valor,
                          min: 0.0,
                          max: 2000.0,
                          label: "R\$ ${valor.toStringAsFixed(2)}",
                          activeColor: CallmaTheme.SECONDARY_GREEN,
                          inactiveColor: CallmaTheme.PRIMARY_GREEN,
                          onChanged: (double value) {
                            setState(() {
                              valor = value;
                            });
                          },
                          divisions: 40,
                        )
                      ],
                    )),
              ),
              SizedBox(height: 10),
              Card(
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
                          SizedBox(
                            height: 20,
                            child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(18.0),
                                    side: BorderSide(
                                        color: CallmaTheme.SECONDARY_GREEN)),
                                color: Colors.white,
                                textColor: CallmaTheme.SECONDARY_GREEN,
                                onPressed: () {},
                                child: Text("Alterar")),
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: <Widget>[Text("Qualquer data disponível")],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Card(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: CustomText(label: "Horário da consulta"),
                          ),
                          Text(
                              "Entre ${horarioInicio.toInt()}:00 e ${horarioFim.toInt()}:00")
                        ],
                      ),
                      SizedBox(height: 10),
                      RangeSlider(
                          values: RangeValues(horarioInicio, horarioFim),
                          min: 1.0,
                          max: 24.0,
                          labels: RangeLabels("${horarioInicio.toInt()}:00",
                              "${horarioFim.toInt()}:00"),
                          activeColor: CallmaTheme.SECONDARY_GREEN,
                          inactiveColor: CallmaTheme.PRIMARY_GREEN,
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
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Card(
                child: Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        Row(children: <Widget>[
                          Expanded(child: CustomText(label: "Distância")),
                          Text("${distancia.toInt()} km")
                        ]),
                        SizedBox(height: 10),
                        Slider(
                          value: distancia,
                          min: 1.0,
                          max: 100.0,
                          label: "${distancia.toInt()} km",
                          activeColor: CallmaTheme.SECONDARY_GREEN,
                          inactiveColor: CallmaTheme.PRIMARY_GREEN,
                          onChanged: (double value) {
                            setState(() {
                              distancia = value;
                            });
                          },
                          divisions: 100,
                        )
                      ],
                    )),
              ),
              Padding(
                  padding: EdgeInsets.all(20.0),
                  child: CustomButton(
                      label: "Filtrar resultado",
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfessionalsView(0)));
                      }))
            ],
          ),
        ));
  }
}
