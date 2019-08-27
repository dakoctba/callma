import 'package:callma/components/CallmaColors.dart';
import 'package:callma/components/bars/CallmaAppBar.dart';
import 'package:callma/components/bars/CallmaBottomNavigationBar.dart';
import "package:flutter/material.dart";
import 'package:url_launcher/url_launcher.dart';

class HelpScreen extends StatelessWidget {

  static const String URL_FAQ = "https://callma.com.br/faq";
  static const String URL_FALE_COM_A_GENTE = "https://callma.com.br/contato";
  static const String URL_COMO_FUNCIONA = "https://callma.com.br/como-funciona";
  static const String URL_TERMOS_DE_USO = "https://callma.com.br/termos-de-uso";
  static const String URL_POLITICA_DE_PRIVACIDADE = "https://callma.com.br/politica-de-privacidade";
  static const String URL_CERTA_MEI = "https://www.certamei.com.br?utm_source=callma&utm_medium=app";

  @override
  Widget build(BuildContext context) {

    List<ListTile> items = new List<ListTile>();
    items.add(_mountOption(0, "Perguntas frequentes"));
    items.add(_mountOption(1, "Fale com a gente"));
    items.add(_mountOption(2, "Como funciona"));
    items.add(_mountOption(3, "Termos de uso"));
    items.add(_mountOption(4, "Política de privacidade"));
    items.add(_mountOption(5, "Formalização MEI"));
    items.add(_mountOption(6, "Sobre o aplicativo"));

    return Scaffold(
        appBar: CallmaAppBar("Ajuda"),
        bottomNavigationBar: CallmaBottomNavigationBar(CallmaBottomNavigationBar.HELP_OPTION),
        body: Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                    children: ListTile.divideTiles(
                        color: CallmaColors.CINZA_BEM_CLARO,
                        tiles: items
                    ).toList()
                ),
              )
            ]
        )
    );
  }

  ListTile _mountOption(int position, String text) {
    return  ListTile(
      title: Text(text),
      trailing: Icon(Icons.keyboard_arrow_right, color: CallmaColors.VERDE_ESCURO),
      onTap: () {
        switch(position) {
          case 0:
            _launchExternalUrl(URL_FAQ);
            break;
          case 1:
            _launchExternalUrl(URL_FALE_COM_A_GENTE);
            break;
          case 2:
            _launchExternalUrl(URL_COMO_FUNCIONA);
            break;
          case 3:
            _launchExternalUrl(URL_TERMOS_DE_USO);
            break;
          case 4:
            _launchExternalUrl(URL_POLITICA_DE_PRIVACIDADE);
            break;
          case 5:
            _launchExternalUrl(URL_CERTA_MEI);
            break;
          case 6:
          default:
            _launchAbout();
            break;
        }
      },
    );
  }

  _launchExternalUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Ops! Erro ao abrir a url";
    }
  }

  _launchAbout() {
    // do nothing yet
  }

}
