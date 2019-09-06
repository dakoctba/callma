import 'package:callma/theme/application_style.dart';
import 'package:callma/models/profession.dart';
import 'package:callma/views/consulta/specialties_screen.dart';
import 'package:flutter/material.dart';

class ProfessionTile extends ListTile {
  final Profession profession;

  ProfessionTile(this.profession);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: const Icon(Icons.fiber_manual_record, color: ApplicationStyle.SECONDARY_GREEN),
        title: Text(profession.title),
        subtitle: profession.subtitle != null ? Text(profession.subtitle) : null,
        trailing: const Icon(Icons.keyboard_arrow_right, color: ApplicationStyle.SECONDARY_GREEN),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => SpecialtiesScreen(profession.id)));
        });
  }
}
