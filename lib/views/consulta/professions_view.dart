import 'package:callma/theme/application_style.dart';
import 'package:callma/components/bars/callma_app_bar.dart';
import 'package:callma/components/bars/callma_bottom_navigation_bar.dart';
import 'package:callma/models/profession.dart';
import 'package:callma/views/consulta/components/profession_tile.dart';
import 'package:callma/repositories/professions_repository.dart';
import 'package:flutter/material.dart';

class ProfessionsView extends StatefulWidget {
  @override
  _ProfessionsScreenState createState() => _ProfessionsScreenState();
}

class _ProfessionsScreenState extends State<ProfessionsView> {
  List<Profession> professions = new List<Profession>();

  @override
  void initState() {
    super.initState();

    ProfessionsRepository.getProfessions().then((data) {
      setState(() {
        professions = data;
      });
    });
  }

  _buidFavoriteTile() {
    return ListTile(
      leading: Icon(Icons.star, color: ApplicationStyle.SECONDARY_GREEN),
      title: Text("Favoritos", style: TextStyle(fontWeight: FontWeight.bold)),
      trailing: Icon(Icons.keyboard_arrow_right, color: ApplicationStyle.SECONDARY_GREEN),
    );
  }

  _buildListTiles() {
    List<ListTile> items = new List<ListTile>();

    if (true) {
      items.add(_buidFavoriteTile());
    }

    items.addAll(professions.map((profession) => ProfessionTile(profession)));

    return ListTile.divideTiles(tiles: items, color: ApplicationStyle.PRIMARY_GREY).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CallmaAppBar(title: "Profissional"),
        bottomNavigationBar: CallmaBottomNavigationBar(CallmaBottomNavigationBar.HOME_OPTION),
        body: Column(children: <Widget>[
          Expanded(
            child: ListView(children: _buildListTiles()),
          )
        ]));
  }
}
