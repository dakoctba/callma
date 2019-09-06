import 'package:callma/theme/application_style.dart';
import 'package:callma/models/specialty.dart';
import 'package:callma/views/consulta/place_screen.dart';
import 'package:flutter/material.dart';

class SpecialtyTile extends ListTile {
  final Specialty specialty;

  SpecialtyTile(this.specialty);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: const Icon(Icons.fiber_manual_record, color: ApplicationStyle.SECONDARY_GREEN),
        title: Text(specialty.title),
        subtitle: specialty.subtitle != null ? Text(specialty.subtitle) : null,
        trailing: const Icon(Icons.keyboard_arrow_right, color: ApplicationStyle.SECONDARY_GREEN),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => PlaceScreen(specialty.id)));
        });
  }
}
