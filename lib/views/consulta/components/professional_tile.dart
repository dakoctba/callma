import 'package:callma/theme/application_style.dart';
import 'package:callma/config/callma_config.dart';
import 'package:callma/models/professional.dart';
import 'package:callma/views/consulta/filters_screen.dart';
import 'package:flutter/material.dart';

class ProfessionalTile extends ListTile {
  final Professional professional;

  ProfessionalTile(this.professional);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: CircleAvatar(
          backgroundImage:
              professional.photo != null ? NetworkImage(professional.photo) : AssetImage(CallmaConfig.DEFAULT_PHOTO),
          backgroundColor: Colors.transparent,
        ),
        title: Text(professional.name),
        trailing: Icon(Icons.keyboard_arrow_right, color: ApplicationStyle.SECONDARY_GREEN),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => FiltersScreen()));
        });
  }
}
