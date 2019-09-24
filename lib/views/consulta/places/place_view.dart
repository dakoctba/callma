import 'package:flutter/material.dart';

import 'package:callma/library/custom_app_bar.dart';
import 'package:callma/library/custom_bottom_navigation_bar.dart';
import 'package:callma/library/custom_button.dart';
import 'package:callma/theme/application_style.dart';
import 'package:callma/views/consulta/professionals/professionals_view.dart';

class PlaceView extends StatelessWidget {
  final int specialtyId;

  PlaceView(this.specialtyId);

  @override
  Widget build(BuildContext context) {
    //
    // Consultório
    //
    ListTile consultorio = ListTile(
      leading: Icon(Icons.public, color: ApplicationStyle.SECONDARY_GREEN),
      title: Text("Consultório"),
      trailing: Icon(Icons.keyboard_arrow_right, color: ApplicationStyle.SECONDARY_GREEN),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfessionalsView(0)));
      },
    );

    //
    // Consultório
    //
    ListTile domicilio = ListTile(
      leading: Icon(Icons.location_on, color: ApplicationStyle.SECONDARY_GREEN),
      title: Text("Domicílio"),
      trailing: Icon(Icons.keyboard_arrow_right, color: ApplicationStyle.SECONDARY_GREEN),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfessionalsView(0)));
      },
    );

    //
    // Construimos uma lista de ListTiles com base na lista de profissões
    //
    List<ListTile> items = new List<ListTile>();
    items.add(consultorio);
    items.add(domicilio);

    return Scaffold(
        appBar: CustomAppBar(title: "Local"),
        bottomNavigationBar: CustomBottomNavigationBar(CustomBottomNavigationBar.HOME_OPTION),
        body: Column(children: <Widget>[
          Expanded(
            child: ListView(
                children: ListTile.divideTiles(context: context, color: ApplicationStyle.TERTIARY_GREY, tiles: items)
                    .toList()),
          ),
          CustomButton("Adicionar endereço", () {})
        ]));
  }
}
