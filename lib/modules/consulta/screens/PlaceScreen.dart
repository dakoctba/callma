import 'package:callma/components/CallmaColors.dart';
import 'package:callma/components/bars/CallmaAppBar.dart';
import 'package:callma/components/bars/CallmaBottomNavigationBar.dart';
import 'package:callma/components/buttons/CallmaButton.dart';
import 'package:flutter/material.dart';

import 'ProfessionalsScreen.dart';

class PlaceScreen extends StatelessWidget {
  final String specialtyId;

  PlaceScreen(this.specialtyId);

  @override
  Widget build(BuildContext context) {

    //
    // Consultório
    //
    ListTile consultorio = ListTile(
      leading: Icon(Icons.public, color: CallmaColors.VERDE_ESCURO),
      title: Text("Consultório"),
      trailing: Icon(Icons.keyboard_arrow_right, color: CallmaColors.VERDE_ESCURO),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ProfessionalsScreen('0'))
        );
      },
    );

    //
    // Consultório
    //
    ListTile domicilio = ListTile(
      leading: Icon(Icons.location_on, color: CallmaColors.VERDE_ESCURO),
      title: Text("Domicílio"),
      trailing: Icon(Icons.keyboard_arrow_right, color: CallmaColors.VERDE_ESCURO),
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ProfessionalsScreen('0'))
        );
      },
    );

    //
    // Construimos uma lista de ListTiles com base na lista de profissões
    //
    List<ListTile> items = new  List<ListTile>();
    items.add(consultorio);
    items.add(domicilio);

    return Scaffold(
        appBar: CallmaAppBar("Local"),
        bottomNavigationBar: CallmaBottomNavigationBar(CallmaBottomNavigationBar.HOME_OPTION),
        body: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                  children: ListTile.divideTiles(
                      color: CallmaColors.CINZA_BEM_CLARO,
                      tiles: items
                  ).toList()
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: CallmaButton("Adicionar endereço")
            )
          ]
        )
    );
  }
}
