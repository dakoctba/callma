import 'package:callma/components/tile_data.dart';
import 'package:callma/theme/application_style.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpBody extends StatelessWidget {
  static const String URL_FAQ = "https://callma.com.br/faq";
  static const String URL_FALE_COM_A_GENTE = "https://callma.com.br/contato";
  static const String URL_COMO_FUNCIONA = "https://callma.com.br/como-funciona";
  static const String URL_TERMOS_DE_USO = "https://callma.com.br/termos-de-uso";
  static const String URL_POLITICA_DE_PRIVACIDADE = "https://callma.com.br/politica-de-privacidade";
  static const String URL_CERTA_MEI = "https://www.certamei.com.br?utm_source=callma&utm_medium=app";

  static Iterable<ListTile> _getItems(BuildContext context) {
    List<TileData> items = new List<TileData>();

    items.add(new TileData(
        label: "Perguntas frequentes",
        onTap: () {
          _launchExternalUrl(URL_FAQ);
        }));
    items.add(new TileData(
        label: "Fale com a gente",
        onTap: () {
          _launchExternalUrl(URL_FALE_COM_A_GENTE);
        }));
    items.add(new TileData(
        label: "Como funciona",
        onTap: () {
          _launchExternalUrl(URL_COMO_FUNCIONA);
        }));
    items.add(new TileData(
        label: "Termos de uso",
        onTap: () {
          _launchExternalUrl(URL_TERMOS_DE_USO);
        }));
    items.add(new TileData(
        label: "Política de privacidade",
        onTap: () {
          _launchExternalUrl(URL_POLITICA_DE_PRIVACIDADE);
        }));
    items.add(new TileData(
        label: "Formalização MEI",
        onTap: () {
          _launchExternalUrl(URL_CERTA_MEI);
        }));
    items.add(new TileData(
        label: "Sobre o aplicativo",
        onTap: () {
          _launchAbout(context);
        }));

    return items.map((item) {
      return ListTile(
        title: Text(item.label),
        trailing: Icon(Icons.keyboard_arrow_right, color: ApplicationStyle.SECONDARY_GREEN),
        onTap: item.onTap,
      );
    });
  }

  static _launchExternalUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Ops! Erro ao abrir a url";
    }
  }

  static _launchAbout(BuildContext context) {
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
    return Column(children: <Widget>[
      Expanded(
        child: ListView(
            children: ListTile.divideTiles(color: ApplicationStyle.TERTIARY_GREY, tiles: _getItems(context)).toList()),
      )
    ]);
  }
}
