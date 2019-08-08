import 'package:callma/components/CallmaColors.dart';
import 'package:callma/services/ProfessionsService.dart';
import 'package:flutter/material.dart';

class ProfessionList extends StatefulWidget {
  @override
  _ProfessionListState createState() => _ProfessionListState();
}

class _ProfessionListState extends State<ProfessionList> {

  List<String> professions = ProfessionsService.getProfessions();

  @override
  Widget build(BuildContext context) {

    ListTile favoriteTile = ListTile(
      leading: Icon(Icons.star, color: CallmaColors.VERDE_ESCURO),
      title: Text("Favoritos", style: TextStyle(fontWeight: FontWeight.bold)),
      trailing: Icon(Icons.keyboard_arrow_right, color: CallmaColors.VERDE_ESCURO),
    );

    List<ListTile> items = professions.map((item) {
      return ListTile(
        leading: Icon(Icons.fiber_manual_record, color: CallmaColors.VERDE_ESCURO),
        title: Text(item),
        trailing: Icon(Icons.keyboard_arrow_right, color: CallmaColors.VERDE_ESCURO),
      );
    }).toList();

    items.insert(0, favoriteTile);

    var dividedTiles = ListTile.divideTiles(
        color: CallmaColors.CINZA_BEM_CLARO,
        tiles: items
    );

    return ListView(
      children: dividedTiles.toList()
    );
  }
}
