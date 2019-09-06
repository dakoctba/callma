import 'package:callma/theme/ApplicationStyle.dart';
import 'package:callma/components/bars/CallmaAppBar.dart';
import 'package:callma/components/bars/CallmaBottomNavigationBar.dart';
import "package:flutter/material.dart";
import 'package:url_launcher/url_launcher.dart';

class HelpScreen extends StatelessWidget {
  static const String URL_FAQ = "https://callma.com.br/faq";
  static const String URL_FALE_COM_A_GENTE = "https://callma.com.br/contato";
  static const String URL_COMO_FUNCIONA = "https://callma.com.br/como-funciona";
  static const String URL_TERMOS_DE_USO = "https://callma.com.br/termos-de-uso";
  static const String URL_POLITICA_DE_PRIVACIDADE =
      "https://callma.com.br/politica-de-privacidade";
  static const String URL_CERTA_MEI =
      "https://www.certamei.com.br?utm_source=callma&utm_medium=app";

  Iterable<ListTile> _getItems(BuildContext context) {
    List<HelpOption> items = new List<HelpOption>();

    items.add(new HelpOption("Perguntas frequentes", Icons.person, () {
      _launchExternalUrl(URL_FAQ);
    }));
    items.add(new HelpOption("Fale com a gente", Icons.place, () {
      _launchExternalUrl(URL_FALE_COM_A_GENTE);
    }));
    items.add(new HelpOption("Como funciona", Icons.people, () {
      _launchExternalUrl(URL_COMO_FUNCIONA);
    }));
    items.add(new HelpOption("Termos de uso", Icons.credit_card, () {
      _launchExternalUrl(URL_TERMOS_DE_USO);
    }));
    items
        .add(new HelpOption("Política de privacidade", Icons.all_inclusive, () {
      _launchExternalUrl(URL_POLITICA_DE_PRIVACIDADE);
    }));
    items.add(new HelpOption("Formalização MEI", Icons.star, () {
      _launchExternalUrl(URL_CERTA_MEI);
    }));
    items.add(new HelpOption("Sobre o aplicativo", Icons.settings, () {
      _launchAbout(context);
    }));

    return items.map((item) {
      return ListTile(
        leading: Icon(item.icon, color: ApplicationStyle.SECONDARY_GREEN),
        title: Text(item.text),
        trailing: Icon(Icons.keyboard_arrow_right,
            color: ApplicationStyle.SECONDARY_GREEN),
        onTap: item.onTap,
      );
    });
  }

  _launchExternalUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Ops! Erro ao abrir a url";
    }
  }

  _launchAbout(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Sobre o aplicativo"),
            content: Text("Versão 1.0.0"),
            actions: <Widget>[
              FlatButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CallmaAppBar(title: "Ajuda"),
        bottomNavigationBar:
            CallmaBottomNavigationBar(CallmaBottomNavigationBar.HELP_OPTION),
        body: Column(children: <Widget>[
          Expanded(
            child: ListView(
                children: ListTile.divideTiles(
                        color: ApplicationStyle.TERTIARY_GREY,
                        tiles: _getItems(context))
                    .toList()),
          )
        ]));
  }
}

class HelpOption {
  String text;
  IconData icon;
  Function onTap;

  HelpOption(this.text, this.icon, this.onTap);
}
