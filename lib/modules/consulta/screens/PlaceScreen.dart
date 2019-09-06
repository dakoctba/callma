import 'package:callma/theme/ApplicationStyle.dart';
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
      leading: Icon(Icons.public, color: ApplicationStyle.SECONDARY_GREEN),
      title: Text("Consultório"),
      trailing: Icon(Icons.keyboard_arrow_right,
          color: ApplicationStyle.SECONDARY_GREEN),
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ProfessionalsScreen('0')));
      },
    );

    //
    // Consultório
    //
    ListTile domicilio = ListTile(
      leading: Icon(Icons.location_on, color: ApplicationStyle.SECONDARY_GREEN),
      title: Text("Domicílio"),
      trailing: Icon(Icons.keyboard_arrow_right,
          color: ApplicationStyle.SECONDARY_GREEN),
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ProfessionalsScreen('0')));
      },
    );

    //
    // Construimos uma lista de ListTiles com base na lista de profissões
    //
    List<ListTile> items = new List<ListTile>();
    items.add(consultorio);
    items.add(domicilio);

    return Scaffold(
        appBar: CallmaAppBar(title: "Local"),
        bottomNavigationBar:
            CallmaBottomNavigationBar(CallmaBottomNavigationBar.HOME_OPTION),
        body: Column(children: <Widget>[
          Expanded(
            child: ListView(
                children: ListTile.divideTiles(
                        color: ApplicationStyle.TERTIARY_GREY, tiles: items)
                    .toList()),
          ),
          CallmaButton("Adicionar endereço", () {})
        ]));
  }
}
