import 'package:callma/theme/application_style.dart';
import 'package:callma/library/custom_app_bar.dart';
import 'package:callma/library/custom_bottom_navigation_bar.dart';
import 'package:callma/models/specialty.dart';
import 'package:callma/views/consulta/specialties/specialty_tile.dart';
import 'package:callma/repositories/specialties_repository.dart';
import 'package:flutter/material.dart';

class SpecialtiesView extends StatefulWidget {
  final int professionId;

  SpecialtiesView(this.professionId);

  @override
  _SpecialtiesViewState createState() => _SpecialtiesViewState(professionId);
}

class _SpecialtiesViewState extends State<SpecialtiesView> {
  int professionId;
  List<Specialty> specialties = new List<Specialty>();

  _SpecialtiesViewState(this.professionId);

  @override
  void initState() {
    super.initState();

    SpecialtiesRepository.getSpecialties(professionId).then((data) {
      setState(() {
        specialties = data;
      });
    });
  }

  _buildListTiles() {
    List<ListTile> items = specialties.map((specialty) => SpecialtyTile(specialty)).toList();

    return ListTile.divideTiles(color: ApplicationStyle.SECONDARY_GREY, tiles: items).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: "Especialidade"),
        bottomNavigationBar: CustomBottomNavigationBar(CustomBottomNavigationBar.HOME_OPTION),
        body: Column(children: <Widget>[
          Expanded(
            child: ListView(children: _buildListTiles()),
          )
        ]));
  }
}
