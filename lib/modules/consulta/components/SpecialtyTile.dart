import 'package:callma/components/CallmaColors.dart';
import 'package:callma/model/Specialty.dart';
import 'package:callma/modules/consulta/screens/PlaceScreen.dart';
import 'package:flutter/material.dart';

class SpecialtyTile extends ListTile {
  final Specialty specialty;

  SpecialtyTile(this.specialty);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.fiber_manual_record, color: CallmaColors.VERDE_ESCURO),
      title: Text(specialty.title),
      subtitle: specialty.subtitle != null ? Text(specialty.subtitle) : null,
      trailing: const Icon(Icons.keyboard_arrow_right, color: CallmaColors.VERDE_ESCURO),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => PlaceScreen(specialty.id)));
      }
    );
  }
}
