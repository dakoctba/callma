import 'package:callma/models/profession.dart';
import 'package:callma/theme/application_style.dart';
import 'package:callma/views/scheduling/specialties/specialties_view.dart';
import 'package:flutter/material.dart';

class ProfessionTile extends ListTile {
  final Profession profession;

  ProfessionTile(this.profession);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(profession.title),
        subtitle: profession.subtitle != null ? Text(profession.subtitle) : null,
        trailing: const Icon(Icons.keyboard_arrow_right, color: ApplicationStyle.SECONDARY_GREEN),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => SpecialtiesView(profession.id)));
        });
  }
}
