import 'package:callma/models/profession.dart';
import 'package:callma/theme/application_style.dart';
import 'package:callma/views/consulta/components/profession_tile.dart';
import 'package:flutter/material.dart';

class ProfessionsViewBody extends StatelessWidget {
  final List<Profession> professions;

  ProfessionsViewBody(this.professions);

  ListTile _buildFavoriteTile() {
    return ListTile(
      leading: Icon(Icons.star, color: ApplicationStyle.SECONDARY_GREEN),
      title: Text("Favoritos", style: TextStyle(fontWeight: FontWeight.bold)),
      trailing: Icon(Icons.keyboard_arrow_right, color: ApplicationStyle.SECONDARY_GREEN),
    );
  }

  Iterable<Widget> _buildListTiles() {
    List<ListTile> items = new List<ListTile>();

    if (true) {
      items.add(_buildFavoriteTile());
    }

    items.addAll(professions.map((profession) => ProfessionTile(profession)));

    return ListTile.divideTiles(tiles: items, color: ApplicationStyle.PRIMARY_GREY).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Expanded(
        child: ListView(children: _buildListTiles()),
      )
    ]);
  }
}
