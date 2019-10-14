import 'package:callma/blocs/menu.bloc.dart';
import 'package:callma/enumerations/menu_option.dart';
import 'package:callma/themes/callma.theme.dart';
import 'package:callma/ui/android/appointments/appointments_view.dart';
import 'package:callma/ui/android/configurations/configurations_view.dart';
import 'package:callma/ui/android/help/help_view.dart';
import 'package:callma/ui/android/scheduling/professions/professions_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final menuItems = <BottomNavigationBarItem>[
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
    BottomNavigationBarItem(icon: Icon(Icons.list), title: Text('Consultas')),
    BottomNavigationBarItem(
        icon: Icon(Icons.notifications), title: Text('Notificações')),
    BottomNavigationBarItem(
        icon: Icon(Icons.person), title: Text('Configurações')),
    BottomNavigationBarItem(icon: Icon(Icons.help), title: Text('Ajuda')),
  ];

  @override
  Widget build(BuildContext context) {
    var menuBloc = Provider.of<MenuBloc>(context);

    return StreamBuilder<MenuOption>(
        stream: menuBloc.menuStream,
        builder: (context, snapshot) {
          return BottomNavigationBar(
            items: menuItems,
            currentIndex: menuBloc.option.index,
            onTap: (index) {
              MenuOption option = MenuOption.values[index];
              menuBloc.setOption(option);

              switch (option) {
                case MenuOption.home:
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProfessionsView()));
                  break;
                case MenuOption.appointments:
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AppointmentsView()));
                  break;
                case MenuOption.notifications:
                  break;
                case MenuOption.configurations:
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ConfigurationsView()));
                  break;
                case MenuOption.help:
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HelpView()));
              }
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: PRIMARY_GREEN,
            selectedItemColor: Colors.white,
            unselectedItemColor: SECONDARY_GREEN,
            showSelectedLabels: false, // Não mostrar as labels nos botões
            showUnselectedLabels: false, // Não mostrar as labels nos botões
          );
        });
  }
}
