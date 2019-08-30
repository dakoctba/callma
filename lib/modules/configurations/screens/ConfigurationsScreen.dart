import 'package:callma/components/CallmaColors.dart';
import 'package:callma/components/bars/CallmaAppBar.dart';
import 'package:callma/components/bars/CallmaBottomNavigationBar.dart';
import 'package:callma/modules/configurations/components/InfoCard.dart';
import 'package:callma/modules/configurations/screens/QrCodeScreen.dart';
import 'package:callma/util/CallmaIcons.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:share/share.dart';

class ConfigurationsScreen extends StatelessWidget {
  static const String URL_FAQ = "https://callma.com.br/faq";
  static const String URL_FALE_COM_A_GENTE = "https://callma.com.br/contato";
  static const String URL_COMO_FUNCIONA = "https://callma.com.br/como-funciona";
  static const String URL_TERMOS_DE_USO = "https://callma.com.br/termos-de-uso";
  static const String URL_POLITICA_DE_PRIVACIDADE = "https://callma.com.br/politica-de-privacidade";
  static const String URL_CERTA_MEI = "https://www.certamei.com.br?utm_source=callma&utm_medium=app";

  Iterable<ListTile> _getItems() {
    List<ConfigurationOption> items = new List<ConfigurationOption>();

    items.add(new ConfigurationOption("Meus dados", Icons.person, () {
      debugPrint("Clicou em Meus dados");
    }));
    items.add(new ConfigurationOption("Endereços", Icons.place, () {
      debugPrint("Clicou em Endereços");
    }));
    items.add(new ConfigurationOption("Dependentes", Icons.people, () {
      debugPrint("Clicou em Dependentes");
    }));
    items.add(new ConfigurationOption("Métodos de pagamento", Icons.credit_card, () {
      debugPrint("Clicou em Métodos de pagamento");
    }));
    items.add(new ConfigurationOption("Programa de pontos", Icons.all_inclusive, () {
      debugPrint("Clicou em Programa de pontos");
    }));
    items.add(new ConfigurationOption("Favoritos", Icons.star, () {
      debugPrint("Clicou em Favoritos");
    }));
    items.add(new ConfigurationOption("Preferências", Icons.settings, () {
      debugPrint("Clicou em Preferências");
    }));
    items.add(new ConfigurationOption("Indicar o aplicativo", Icons.share, () {
      Share.share(
          'Encontre um profissional da saúde na sua região. Atendimento domiciliar ou em consultório. Consulte opiniões de pacientes e agende uma consulta online agora. https://callma.com.br');
    }));
    items.add(new ConfigurationOption("Sair", Icons.exit_to_app, () {
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    }));

    return items.map((item) {
      return ListTile(
        leading: Icon(item.icon, color: CallmaColors.VERDE_ESCURO),
        title: Text(item.text),
        trailing: Icon(Icons.keyboard_arrow_right, color: CallmaColors.VERDE_ESCURO),
        onTap: item.onTap,
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CallmaAppBar("Minha conta", actions: <Widget>[
          GestureDetector(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Icon(CallmaIcons.qrcode),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => QrCodeScreen()));
              })
        ]),
        bottomNavigationBar: CallmaBottomNavigationBar(CallmaBottomNavigationBar.CONFIGURATIONS_OPTION),
        body: Column(children: <Widget>[
          InfoCard(),
          Expanded(
            child: ListView(
                children: ListTile.divideTiles(color: CallmaColors.CINZA_BEM_CLARO, tiles: _getItems()).toList()),
          )
        ]));
  }
}

class ConfigurationOption {
  String text;
  IconData icon;
  Function onTap;

  ConfigurationOption(this.text, this.icon, this.onTap);
}
