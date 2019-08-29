import 'package:callma/components/CallmaColors.dart';
import 'package:callma/model/Profession.dart';
import 'package:callma/modules/consulta/screens/SpecialtiesScreen.dart';
import 'package:flutter/material.dart';

class ProfessionTile extends ListTile {
  final Profession profession;

  ProfessionTile(this.profession);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: const Icon(Icons.fiber_manual_record, color: CallmaColors.VERDE_ESCURO),
        title: Text(profession.title),
        subtitle: profession.subtitle != null ? Text(profession.subtitle) : null,
        trailing: const Icon(Icons.keyboard_arrow_right, color: CallmaColors.VERDE_ESCURO),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => SpecialtiesScreen(profession.id)));
        }
    );
  }
}
