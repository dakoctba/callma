import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:callma/blocs/user.bloc.dart';
import 'package:callma/themes/callma_icons.dart';
import 'package:callma/themes/callma.theme.dart';
import 'package:callma/ui/android/configurations/addresses/address-list.view.dart';
import 'package:callma/ui/android/configurations/info_card.dart';
import 'package:callma/ui/android/configurations/qr_code/qrcode.view.dart';
import 'package:callma/ui/android/login/login.view.dart';
import 'package:callma/ui/shared/custom_app_bar.dart';
import 'package:callma/ui/shared/custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:callma/ui/shared/tile_data.dart';
import 'package:share/share.dart';
import "package:flutter/material.dart";

class ConfigurationsView extends StatefulWidget {
  @override
  _ConfigurationsViewState createState() => _ConfigurationsViewState();
}

class _ConfigurationsViewState extends State<ConfigurationsView> {
  UserBloc userBloc;

  static const String URL_FAQ = "https://callma.com.br/faq";
  static const String URL_FALE_COM_A_GENTE = "https://callma.com.br/contato";
  static const String URL_COMO_FUNCIONA = "https://callma.com.br/como-funciona";
  static const String URL_TERMOS_DE_USO = "https://callma.com.br/termos-de-uso";
  static const String URL_POLITICA_DE_PRIVACIDADE =
      "https://callma.com.br/politica-de-privacidade";
  static const String URL_CERTA_MEI =
      "https://www.certamei.com.br?utm_source=callma&utm_medium=app";

  @override
  void initState() {
    userBloc = BlocProvider.getBloc<UserBloc>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar("Minha conta", actions: <Widget>[
          GestureDetector(
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Icon(CallmaIcons.qrcode),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => QrCodeView()));
              })
        ]),
        bottomNavigationBar: CustomBottomNavigationBar(),
        body: Column(children: <Widget>[
          InfoCard(),
          Expanded(
            child: ListView(
                children: ListTile.divideTiles(
                        context: context,
                        color: TERTIARY_GREY,
                        tiles: _getItems(context))
                    .toList()),
          )
        ]));
  }

  Iterable<ListTile> _getItems(BuildContext context) {
    List<TileData> items = new List<TileData>();

    items.add(new TileData(
        label: "Dependentes",
        icon: Icons.people,
        onTap: () {
          debugPrint("Clicou em Dependentes");
        }));
    items.add(new TileData(
        label: "Endere??os",
        icon: Icons.place,
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddressListView()));
        }));
    items.add(new TileData(
        label: "Favoritos",
        icon: Icons.favorite_border,
        onTap: () {
          debugPrint("Clicou em Favoritos");
        }));
    items.add(new TileData(
        label: "Indicar o aplicativo",
        icon: Icons.share,
        onTap: () {
          Share.share(
              'Encontre um profissional da sa??de na sua regi??o. Atendimento domiciliar ou em consult??rio. Consulte opini??es de pacientes e agende uma consulta online agora. https://callma.com.br');
        }));
    items.add(new TileData(
        label: "M??todos de pagamento",
        icon: Icons.credit_card,
        onTap: () {
          debugPrint("Clicou em M??todos de pagamento");
        }));
    items.add(new TileData(
        label: "Meus dados",
        icon: Icons.person,
        onTap: () {
          debugPrint("Clicou em Meus dados");
        }));
    items.add(new TileData(
        label: "Prefer??ncias",
        icon: Icons.tune,
        onTap: () {
          debugPrint("Clicou em Prefer??ncias");
        }));
    items.add(new TileData(
        label: "Programa de pontos",
        icon: Icons.loyalty,
        onTap: () {
          debugPrint("Clicou em Programa de pontos");
        }));

    items.add(new TileData(
        label: "Sair",
        icon: Icons.exit_to_app,
        onTap: () async {
          await userBloc.logout();
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginView()));
        }));

    return items.map((item) {
      return ListTile(
        leading: Icon(item.icon, color: SECONDARY_GREEN),
        title: Text(item.label),
        trailing: Icon(Icons.keyboard_arrow_right, color: SECONDARY_GREEN),
        onTap: item.onTap,
      );
    });
  }
}
