import 'package:callma/blocs/profession.bloc.dart';
import 'package:callma/models/profession.dart';
import 'package:callma/themes/callma.theme.dart';
import 'package:callma/ui/android/scheduling/professions/partials/_profession_card.dart';
import 'package:callma/ui/shared/custom_app_bar.dart';
import 'package:callma/ui/shared/custom_bottom_navigation_bar.dart';
import 'package:callma/ui/shared/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfessionsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final professionBloc = Provider.of<ProfessionBloc>(context);
    professionBloc.getProfessions();

    return Scaffold(
        appBar: CustomAppBar(title: "Profissional"),
        bottomNavigationBar: CustomBottomNavigationBar(),
        body: Column(
          children: <Widget>[
            Expanded(
              child: StreamBuilder<List<Profession>>(
                stream: professionBloc.stream,
                initialData: [],
                builder: (context, AsyncSnapshot<List<Profession>> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.separated(
                      separatorBuilder: (context, index) =>
                          Divider(color: SECONDARY_GREY, height: 0),
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return ProfessionCard(snapshot.data[index]);
                      },
                    );
                  } else {
                    return CustomLoading("Carregando profissões");
                  }
                },
              ),
            ),
            Divider(color: SECONDARY_GREY, height: 0),
            ListTile(
              title: Text("Favoritos",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              trailing:
                  Icon(Icons.keyboard_arrow_right, color: SECONDARY_GREEN),
            )
          ],
        ));
  }
}
