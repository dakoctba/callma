import 'package:callma/library/tile_data.dart';
import 'package:callma/theme/application_style.dart';
import 'package:callma/views/help/webview_view.dart';
import 'package:flutter/material.dart';

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
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => WebviewView("Perguntas frequentes", URL_FAQ)));
        }));
    items.add(new TileData(
        label: "Fale com a gente",
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => WebviewView("Fale com a gente", URL_FALE_COM_A_GENTE)));
        }));
    items.add(new TileData(
        label: "Como funciona",
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => WebviewView("Como funciona", URL_COMO_FUNCIONA)));
        }));
    items.add(new TileData(
        label: "Termos de uso",
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => WebviewView("Termos de uso", URL_TERMOS_DE_USO)));
        }));
    items.add(new TileData(
        label: "Política de privacidade",
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => WebviewView("Política de privacidade", URL_POLITICA_DE_PRIVACIDADE)));
        }));
    items.add(new TileData(
        label: "Formalização MEI",
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => WebviewView("Formalização MEI", URL_CERTA_MEI)));
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
            children:
                ListTile.divideTiles(context: context, color: ApplicationStyle.TERTIARY_GREY, tiles: _getItems(context))
                    .toList()),
      )
    ]);
  }
}
