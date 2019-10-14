import 'package:flutter/material.dart';

import 'package:callma/ui/shared/custom_app_bar.dart';
import 'package:callma/ui/shared/custom_bottom_navigation_bar.dart';
import 'package:callma/ui/shared/custom_button.dart';
import 'package:callma/themes/callma.theme.dart';
import 'package:callma/ui/android/scheduling/professionals/professionals_view.dart';

class PlaceView extends StatelessWidget {
  final int specialtyId;

  PlaceView(this.specialtyId);

  @override
  Widget build(BuildContext context) {
    //
    // Consultório
    //
    ListTile consultorio = ListTile(
      leading: Icon(Icons.public, color: SECONDARY_GREEN),
      title: Text("Consultório"),
      trailing: Icon(Icons.keyboard_arrow_right, color: SECONDARY_GREEN),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProfessionalsView(this.specialtyId)));
      },
    );

    //
    // Consultório
    //
    ListTile domicilio = ListTile(
      leading: Icon(Icons.location_on, color: SECONDARY_GREEN),
      title: Text("Domicílio"),
      trailing: Icon(Icons.keyboard_arrow_right, color: SECONDARY_GREEN),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProfessionalsView(this.specialtyId)));
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
        bottomNavigationBar: CustomBottomNavigationBar(),
        body: Column(children: <Widget>[
          Expanded(
            child: ListView(
                children: ListTile.divideTiles(
                        context: context, color: TERTIARY_GREY, tiles: items)
                    .toList()),
          ),
          CustomButton(label: "Adicionar endereço", onPressed: () {})
        ]));
  }
}
