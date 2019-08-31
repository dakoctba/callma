import 'package:callma/components/CallmaColors.dart';
import 'package:callma/components/bars/CallmaAppBar.dart';
import 'package:callma/components/bars/CallmaBottomNavigationBar.dart';
import 'package:callma/model/Profession.dart';
import 'package:callma/modules/consulta/components/ProfessionTile.dart';
import 'package:callma/services/ProfessionsService.dart';
import 'package:flutter/material.dart';

class ProfessionsScreen extends StatefulWidget {
  @override
  _ProfessionsScreenState createState() => _ProfessionsScreenState();
}

class _ProfessionsScreenState extends State<ProfessionsScreen> {
  List<Profession> professions = new List<Profession>();

  @override
  void initState() {
    super.initState();

    ProfessionsService.getProfessions().then((data) {
      setState(() {
        professions = data;
      });
    });
  }

  _buidFavoriteTile() {
    return ListTile(
      leading: Icon(Icons.star, color: CallmaColors.VERDE_ESCURO),
      title: Text("Favoritos", style: TextStyle(fontWeight: FontWeight.bold)),
      trailing: Icon(Icons.keyboard_arrow_right, color: CallmaColors.VERDE_ESCURO),
    );
  }

  _buildListTiles() {
    List<ListTile> items = new List<ListTile>();

    if (true) {
      items.add(_buidFavoriteTile());
    }

    items.addAll(professions.map((profession) => ProfessionTile(profession)));

    return ListTile.divideTiles(tiles: items, color: CallmaColors.CINZA).toList();
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
