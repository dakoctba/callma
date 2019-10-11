import 'package:callma/controllers/menu_controller.dart';
import 'package:callma/enumerations/menu_option.dart';
import 'package:callma/theme/application_style.dart';
import 'package:callma/views/appointments/appointments_view.dart';
import 'package:callma/views/configurations/configurations_view.dart';
import 'package:callma/views/help/help_view.dart';
import 'package:callma/views/scheduling/professions/professions_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final menuItems = <BottomNavigationBarItem>[
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
    BottomNavigationBarItem(icon: Icon(Icons.list), title: Text('Consultas')),
    BottomNavigationBarItem(icon: Icon(Icons.notifications), title: Text('Notificações')),
    BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('Configurações')),
    BottomNavigationBarItem(icon: Icon(Icons.help), title: Text('Ajuda')),
  ];

  @override
  Widget build(BuildContext context) {
    var menuController = Provider.of<MenuController>(context);

    return StreamBuilder<MenuOption>(
        stream: menuController.menuStream,
        builder: (context, snapshot) {
          return BottomNavigationBar(
            items: menuItems,
            currentIndex: menuController.option.index,
            onTap: (index) {
              MenuOption option = MenuOption.values[index];
              menuController.setOption(option);

              switch (option) {
                case MenuOption.home:
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfessionsView()));
                  break;
                case MenuOption.appointments:
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AppointmentsView()));
                  break;
                case MenuOption.notifications:
                  break;
                case MenuOption.configurations:
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ConfigurationsView()));
                  break;
                case MenuOption.help:
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HelpView()));
              }
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: ApplicationStyle.PRIMARY_GREEN,
            selectedItemColor: Colors.white,
            unselectedItemColor: ApplicationStyle.SECONDARY_GREEN,
            showSelectedLabels: false, // Não mostrar as labels nos botões
            showUnselectedLabels: false, // Não mostrar as labels nos botões
          );
        });
  }
}
