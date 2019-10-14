import 'package:callma/themes/callma.theme.dart';
import 'package:callma/models/specialty.dart';
import 'package:callma/ui/android/scheduling/places/place_view.dart';
import 'package:flutter/material.dart';

class SpecialtyTile extends ListTile {
  final Specialty specialty;

  SpecialtyTile(this.specialty);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(specialty.title),
        subtitle: specialty.subtitle != null ? Text(specialty.subtitle) : null,
        trailing:
            const Icon(Icons.keyboard_arrow_right, color: SECONDARY_GREEN),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => PlaceView(specialty.id)));
        });
  }
}
