import 'package:callma/components/CallmaColors.dart';
import 'package:callma/components/bars/CallmaAppBar.dart';
import 'package:callma/components/bars/CallmaBottomNavigationBar.dart';
import 'package:callma/model/Profession.dart';
import 'package:callma/services/ProfessionsService.dart';
import 'package:flutter/material.dart';

import 'SpecialtiesScreen.dart';

class ProfessionsScreen extends StatelessWidget {
  final List<Profession> professions = ProfessionsService.getProfessions();

  @override
  Widget build(BuildContext context) {
    //
    // Construimos uma lista de ListTiles com base na lista de profissões
    //
    List<ListTile> items = professions.map((profession) {
      return ListTile(
        leading: Icon(Icons.fiber_manual_record, color: CallmaColors.VERDE_ESCURO),
        title: Text(profession.description),
        trailing: Icon(Icons.keyboard_arrow_right, color: CallmaColors.VERDE_ESCURO),
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => SpecialtiesScreen(profession.id))
          );
        },
      );
    }).toList();

    //
    // Se tiver profissionais favoritos, adiciona a opção 'Favoritos' na primeira posição
    //
    bool hasFavorites = true;

    if (hasFavorites) {
      ListTile favoriteTile = ListTile(
        leading: Icon(Icons.star, color: CallmaColors.VERDE_ESCURO),
        title: Text("Favoritos", style: TextStyle(fontWeight: FontWeight.bold)),
        trailing: Icon(Icons.keyboard_arrow_right, color: CallmaColors.VERDE_ESCURO),
      );

      items.insert(0, favoriteTile);
    }

    return Scaffold(
        appBar: CallmaAppBar("Profissional"),
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
              )
            ]
        )
    );
  }
}

