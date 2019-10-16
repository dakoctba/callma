import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:callma/blocs/menu.bloc.dart';
import 'package:callma/themes/callma.theme.dart';
import 'package:callma/ui/android/appointments/appointments.view.dart';
import 'package:callma/ui/android/configurations/configurations.view.dart';
import 'package:callma/ui/android/help/help.view.dart';
import 'package:callma/ui/android/notifications/notifications.view.dart';
import 'package:callma/ui/android/scheduling/professions/professions.view.dart';
import 'package:flutter/material.dart';

class PatientMenu extends StatefulWidget {
  @override
  _PatientMenuState createState() => _PatientMenuState();
}

class _PatientMenuState extends State<PatientMenu> {
  MenuBloc menuBloc;

  @override
  void initState() {
    menuBloc = BlocProvider.getBloc<MenuBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.list), title: Text('Consultas')),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), title: Text('Notificações')),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text('Configurações')),
          BottomNavigationBarItem(icon: Icon(Icons.help), title: Text('Ajuda')),
        ],
        currentIndex: menuBloc.selectedOption,
        type: BottomNavigationBarType.fixed,
        backgroundColor: PRIMARY_GREEN,
        selectedItemColor: Colors.white,
        unselectedItemColor: SECONDARY_GREEN,
        showSelectedLabels: false, // Não mostrar as labels nos botões
        showUnselectedLabels: false, //
        onTap: (index) {
          menuBloc.setOption(index);

          switch (index) {
            case 0:
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => ProfessionsView()));
              break;
            case 1:
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => AppointmentsView()));
              break;
            case 2:
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => NotificationsView()));
              break;
            case 3:
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ConfigurationsView()));
              break;
            case 4:
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => HelpView()));
          }
        });
  }
}
