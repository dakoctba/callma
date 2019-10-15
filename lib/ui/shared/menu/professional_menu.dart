import 'package:callma/blocs/menu.bloc.dart';
import 'package:callma/themes/callma.theme.dart';
import 'package:callma/ui/android/configurations/configurations_view.dart';
import 'package:callma/ui/android/help/help_view.dart';
import 'package:callma/ui/android/notifications/notifications.view.dart';
import 'package:callma/ui/android/professional/financial/financial.view.dart';
import 'package:callma/ui/android/professional/home/home.view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfessionalMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var menuBloc = Provider.of<MenuBloc>(context);

    return BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), title: Text('Agenda')),
          BottomNavigationBarItem(
              icon: Icon(Icons.attach_money), title: Text('Financeiro')),
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
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => HomeView()));
              break;
            case 1:
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => FinancialView()));
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
