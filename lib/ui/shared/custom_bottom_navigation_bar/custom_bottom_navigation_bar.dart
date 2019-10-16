import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:callma/blocs/user.bloc.dart';
import 'package:callma/enumerations/user_type.dart';
import 'package:callma/ui/shared/custom_bottom_navigation_bar/patient_menu.dart';
import 'package:callma/ui/shared/custom_bottom_navigation_bar/professional_menu.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  UserBloc userBloc;

  @override
  void initState() {
    userBloc = BlocProvider.getBloc<UserBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UserType userType = userBloc.user.userType;

    if (userType == UserType.professional) {
      return ProfessionalMenu();
    }

    return PatientMenu();
  }
}
