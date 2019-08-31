import 'package:callma/components/CallmaColors.dart';
import 'package:callma/components/bars/CallmaAppBar.dart';
import 'package:callma/components/bars/CallmaBottomNavigationBar.dart';
import 'package:callma/model/Specialty.dart';
import 'package:callma/modules/consulta/components/SpecialtyTile.dart';
import 'package:callma/services/SpecialtiesService.dart';
import 'package:flutter/material.dart';

class SpecialtiesScreen extends StatefulWidget {
  final String professionId;

  SpecialtiesScreen(this.professionId);

  @override
  _SpecialtiesScreenState createState() => _SpecialtiesScreenState(professionId);
}

class _SpecialtiesScreenState extends State<SpecialtiesScreen> {
  String professionId;
  List<Specialty> specialties = new List<Specialty>();

  _SpecialtiesScreenState(this.professionId);

  @override
  void initState() {
    super.initState();

    SpecialtiesService.getSpecialties(professionId).then((data) {
      setState(() {
        specialties = data;
      });
    });
  }

  _buildListTiles() {
    List<ListTile> items = specialties.map((specialty) => SpecialtyTile(specialty)).toList();

    return ListTile.divideTiles(color: CallmaColors.CINZA, tiles: items).toList();
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
