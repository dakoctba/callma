import 'package:callma/theme/application_style.dart';
import 'package:callma/components/bars/callma_app_bar.dart';
import 'package:callma/components/bars/callma_bottom_navigation_bar.dart';
import 'package:callma/models/specialty.dart';
import 'package:callma/views/consulta/components/specialty_tile.dart';
import 'package:callma/repositories/specialties_repository.dart';
import 'package:flutter/material.dart';

class SpecialtiesView extends StatefulWidget {
  final String professionId;

  SpecialtiesView(this.professionId);

  @override
  _SpecialtiesViewState createState() => _SpecialtiesViewState(professionId);
}

class _SpecialtiesViewState extends State<SpecialtiesView> {
  String professionId;
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

    return ListTile.divideTiles(color: ApplicationStyle.PRIMARY_GREY, tiles: items).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CallmaAppBar(title: "Especialidade"),
        bottomNavigationBar: CallmaBottomNavigationBar(CallmaBottomNavigationBar.HOME_OPTION),
        body: Column(children: <Widget>[
          Expanded(
            child: ListView(children: _buildListTiles()),
          )
        ]));
  }
}