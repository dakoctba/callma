import 'package:callma/models/profession.dart';
import 'package:callma/themes/callma.theme.dart';
import 'package:callma/ui/android/scheduling/specialties/specialties_view.dart';
import 'package:flutter/material.dart';

class ProfessionCard extends ListTile {
  final Profession profession;

  ProfessionCard(this.profession);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(profession.title),
        subtitle:
            profession.subtitle != null ? Text(profession.subtitle) : null,
        trailing:
            const Icon(Icons.keyboard_arrow_right, color: SECONDARY_GREEN),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SpecialtiesView(profession.id)));
        });
  }
}
