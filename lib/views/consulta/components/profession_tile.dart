import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:callma/models/profession.dart';
import 'package:callma/theme/application_style.dart';
import 'package:callma/views/consulta/specialties_view.dart';

class ProfessionTile extends ListTile {
  final Profession profession;

  ProfessionTile(this.profession);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: const Icon(FontAwesomeIcons.diagnoses, color: ApplicationStyle.SECONDARY_GREEN),
        title: Text(profession.title),
        subtitle: profession.subtitle != null ? Text(profession.subtitle) : null,
        trailing: const Icon(Icons.keyboard_arrow_right, color: ApplicationStyle.SECONDARY_GREEN),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => SpecialtiesView(profession.id)));
        });
  }
}
