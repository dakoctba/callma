import 'package:callma/components/CallmaColors.dart';
import 'package:callma/model/Professional.dart';
import 'package:callma/modules/consulta/screens/FiltersScreen.dart';
import 'package:flutter/material.dart';

class ProfessionalTile extends ListTile {
  final Professional professional;

  ProfessionalTile(this.professional);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.fiber_manual_record, color: CallmaColors.CINZA_BEM_CLARO),
      title: Text(professional.name),
      trailing: Icon(Icons.keyboard_arrow_right, color: CallmaColors.VERDE_ESCURO),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => FiltersScreen()));
      }
    );
  }
}
