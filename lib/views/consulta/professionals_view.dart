import 'package:callma/theme/application_style.dart';
import 'package:callma/components/bars/callma_app_bar.dart';
import 'package:callma/components/bars/callma_bottom_navigation_bar.dart';
import 'package:callma/models/professional.dart';
import 'package:callma/views/consulta/components/professional_tile.dart';
import 'package:callma/repositories/professionals_repository.dart';
import 'package:flutter/material.dart';

class ProfessionalsView extends StatefulWidget {
  final String specialtyId;

  ProfessionalsView(this.specialtyId);

  @override
  _ProfessionalsScreenState createState() => _ProfessionalsScreenState(this.specialtyId);
}

class _ProfessionalsScreenState extends State<ProfessionalsView> {
  String specialtyId;
  List<Professional> professionals = new List<Professional>();

  _ProfessionalsScreenState(this.specialtyId);

  @override
  void initState() {
    super.initState();

    ProfessionalsRepository.getProfessionals(this.specialtyId).then((data) {
      setState(() {
        professionals = data;
      });
    });
  }

  _buildListTiles() {
    List<ListTile> items = professionals.map((specialty) => ProfessionalTile(specialty)).toList();

    return ListTile.divideTiles(color: ApplicationStyle.PRIMARY_GREY, tiles: items).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CallmaAppBar(title: "Profissionais"),
        bottomNavigationBar: CallmaBottomNavigationBar(CallmaBottomNavigationBar.HOME_OPTION),
        body: Column(children: <Widget>[
          Expanded(
            child: ListView(children: _buildListTiles()),
          )
        ]));
  }
}
