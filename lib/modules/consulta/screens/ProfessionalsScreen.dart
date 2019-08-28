import 'package:callma/components/CallmaColors.dart';
import 'package:callma/components/bars/CallmaAppBar.dart';
import 'package:callma/components/bars/CallmaBottomNavigationBar.dart';
import 'package:callma/model/Professional.dart';
import 'package:callma/modules/consulta/components/ProfessionalTile.dart';
import 'package:callma/services/ProfessionalsService.dart';
import 'package:flutter/material.dart';

class ProfessionalsScreen extends StatefulWidget {
  final String specialtyId;

  ProfessionalsScreen(this.specialtyId);

  @override
  _ProfessionalsScreenState createState() => _ProfessionalsScreenState(this.specialtyId);
}

class _ProfessionalsScreenState extends State<ProfessionalsScreen> {
  String specialtyId;
  List<Professional> professionals = new List<Professional>();

  _ProfessionalsScreenState(this.specialtyId);

  @override
  void initState() {
    super.initState();

    ProfessionalsService.getProfessionals(this.specialtyId).then((data) {
      setState(() {
        professionals = data;
      });
    });
  }

  _buildListTiles() {
    List<ListTile> items = professionals.map((specialty) => ProfessionalTile(specialty)).toList();

    return ListTile.divideTiles(color: CallmaColors.CINZA, tiles: items).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CallmaAppBar("Profissionais"),
        bottomNavigationBar: CallmaBottomNavigationBar(CallmaBottomNavigationBar.HOME_OPTION),
        body: Column(children: <Widget>[
          Expanded(
            child: ListView(children: _buildListTiles()),
          )
        ]));
  }
}
