import 'package:callma/components/CallmaColors.dart';
import 'package:callma/model/Professional.dart';
import 'package:callma/modules/consulta/screens/FiltersScreen.dart';
import 'package:flutter/material.dart';

class ProfessionalTile extends ListTile {
  final Professional professional;

  static const String DEFAULT_PHOTO = 'https://callma.com.br/assets/logo.png';

  ProfessionalTile(this.professional);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: professional.photo != null ? NetworkImage(professional.photo) : NetworkImage(DEFAULT_PHOTO),
        backgroundColor: Colors.transparent,
      ),
      title: Text(professional.name),
      trailing: Icon(Icons.keyboard_arrow_right, color: CallmaColors.VERDE_ESCURO),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => FiltersScreen()));
      }
    );
  }
}
