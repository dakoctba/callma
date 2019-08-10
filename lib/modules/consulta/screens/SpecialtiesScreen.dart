import 'package:callma/components/CallmaColors.dart';
import 'package:callma/components/bars/CallmaAppBar.dart';
import 'package:callma/components/bars/CallmaBottomNavigationBar.dart';
import 'package:callma/model/Specialty.dart';
import 'package:callma/services/SpecialtiesService.dart';
import 'package:flutter/material.dart';

import 'PlaceScreen.dart';

class SpecialtiesScreen extends StatelessWidget {

  final String professionId;

  SpecialtiesScreen(this.professionId);

  @override
  Widget build(BuildContext context) {

    List<Specialty> specialties = SpecialtiesService.getSpecialties();

    //
    // Construimos uma lista de ListTiles com base na lista de profissões
    //
    List<ListTile> items = specialties.map((specialty) {
      return ListTile(
        leading: Icon(Icons.fiber_manual_record, color: CallmaColors.VERDE_ESCURO),
        title: Text(specialty.description),
        trailing: Icon(Icons.keyboard_arrow_right, color: CallmaColors.VERDE_ESCURO),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => PlaceScreen(specialty.id))
          );
        },
      );
    }).toList();

    //
    // Monta a tela
    //
    return Scaffold(
        appBar: CallmaAppBar("Especialidade"),
        bottomNavigationBar: CallmaBottomNavigationBar(CallmaBottomNavigationBar.HOME_OPTION),
        body: Container(
            color: Colors.white,
            child: ListView(
                children: ListTile.divideTiles(
                    color: CallmaColors.CINZA_BEM_CLARO,
                    tiles: items
                ).toList()
            )
        )
    );
  }
}