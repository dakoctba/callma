import 'package:callma/blocs/user.bloc.dart';
import 'package:callma/enumerations/user_type.dart';
import 'package:callma/ui/shared/menu/patient_menu.dart';
import 'package:callma/ui/shared/menu/professional_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var userBloc = Provider.of<UserBloc>(context);

    UserType userType = userBloc.user.userType;

    if (userType == UserType.professional) {
      return ProfessionalMenu();
    }

    return PatientMenu();
  }
}
