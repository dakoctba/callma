import 'package:callma/blocs/professions_bloc.dart';
import 'package:callma/models/profession.dart';
import 'package:callma/repositories/professions_repository.dart';
import 'package:callma/theme/application_style.dart';
import 'package:callma/views/consulta/professions/profession_tile.dart';
import 'package:flutter/material.dart';

import 'package:callma/library/custom_app_bar.dart';
import 'package:callma/library/custom_bottom_navigation_bar.dart';

class ProfessionsView extends StatelessWidget {
  _body(BuildContext context) async {
    List<ListTile> items = new List<ListTile>();

    if (true) {
      var favoriteTile = ListTile(
        leading: Icon(Icons.star, color: ApplicationStyle.SECONDARY_GREEN),
        title: Text("Favoritos", style: TextStyle(fontWeight: FontWeight.bold)),
        trailing: Icon(Icons.keyboard_arrow_right, color: ApplicationStyle.SECONDARY_GREEN),
      );

      items.add(favoriteTile);
    }

    List<Profession> professions = await ProfessionsRepository.getProfessions();

    if (professions.length > 0) {
      items.addAll(professions.map((profession) => ProfessionTile(profession)));
    }

    return ListTile.divideTiles(context: context, tiles: items, color: ApplicationStyle.SECONDARY_GREY).toList();
  }

  Widget _buildLoadingWidget() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text("Carregando profissões..."), CircularProgressIndicator()],
    ));
  }

  Widget lista(BuildContext context) {
    bloc.getProfessions();

    return StreamBuilder<List<Profession>>(
      stream: bloc.subject.stream,
      builder: (context, AsyncSnapshot<List<Profession>> snapshot) {
        if (snapshot.hasData) {
          return ListView.separated(
            separatorBuilder: (context, index) => Divider(color: ApplicationStyle.SECONDARY_GREY, height: 0),
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return ProfessionTile(snapshot.data[index]);
            },
          );
        } else {
          return _buildLoadingWidget();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: "Profissional"),
        bottomNavigationBar: CustomBottomNavigationBar(CustomBottomNavigationBar.HOME_OPTION),
        body: lista(context));
  }
}
