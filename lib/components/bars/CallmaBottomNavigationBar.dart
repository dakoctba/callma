import 'package:callma/components/CallmaColors.dart';
import 'package:callma/components/StatusScreen.dart';
import 'package:callma/modules/configurations/screens/ConfigurationsScreen.dart';
import 'package:callma/modules/consulta/screens/ProfessionsScreen.dart';
import 'package:callma/modules/help/screens/HelpScreen.dart';
import 'package:callma/modules/login/screens/LoginScreen.dart';
import 'package:flutter/material.dart';

class CallmaBottomNavigationBar extends StatelessWidget {
  int _selectedIndex = 0;

  static const int HOME_OPTION = 0;
  static const int LIST_OPTION = 1;
  static const int NOTIFICATIONS_OPTION = 2;
  static const int CONFIGURATIONS_OPTION = 3;
  static const int HELP_OPTION = 4;

  CallmaBottomNavigationBar(this._selectedIndex);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
        BottomNavigationBarItem(icon: Icon(Icons.list), title: Text('Consultas')),
        BottomNavigationBarItem(icon: Icon(Icons.notifications), title: Text('Notificações')),
        BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('Configurações')),
        BottomNavigationBarItem(icon: Icon(Icons.help), title: Text('Ajuda')),
      ],
      currentIndex: _selectedIndex,
      onTap: (option) {
        switch (option) {
          case LIST_OPTION:
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => StatusScreen("Dependente alterado com sucesso", true, "Voltar para tela inicial", () {
                Navigator.of(context).pop();
              })));
            break;
          case NOTIFICATIONS_OPTION:
            break;
          case CONFIGURATIONS_OPTION:
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ConfigurationsScreen()));
            break;
          case HELP_OPTION:
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HelpScreen()));
            break;
          case HOME_OPTION:
          default:
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ProfessionsScreen()));
        }
      },
      type: BottomNavigationBarType.fixed,
      backgroundColor: CallmaColors.BACKGROUND_COLOR,
      selectedItemColor: Colors.white,
      unselectedItemColor: CallmaColors.VERDE_ESCURO,
      showSelectedLabels: false,
      // Não mostrar as labels nos botões
      showUnselectedLabels: false, // Não mostrar as labels nos botões
    );
  }
}
