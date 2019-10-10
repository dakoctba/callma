import 'package:callma/controllers/professions_controller.dart';
import 'package:callma/models/profession.dart';
import 'package:callma/theme/application_style.dart';
import 'package:callma/views/scheduling/professions/partials/_profession_card.dart';
import 'package:flutter/material.dart';

import 'package:callma/library/custom_app_bar.dart';
import 'package:callma/library/custom_bottom_navigation_bar.dart';
import 'package:provider/provider.dart';

class ProfessionsView extends StatelessWidget {
  Widget _buildLoadingWidget() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text("Carregando profissões..."), SizedBox(height: 10), CircularProgressIndicator()],
    ));
  }

  @override
  Widget build(BuildContext context) {
    final professionsController = Provider.of<ProfessionsController>(context);
    professionsController.getProfessions();

    return Scaffold(
        appBar: CustomAppBar(title: "Profissional"),
        bottomNavigationBar: CustomBottomNavigationBar(CustomBottomNavigationBar.HOME_OPTION),
        body: Column(
          children: <Widget>[
            Expanded(
              child: StreamBuilder<List<Profession>>(
                stream: professionsController.stream,
                initialData: [],
                builder: (context, AsyncSnapshot<List<Profession>> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.separated(
                      separatorBuilder: (context, index) => Divider(color: ApplicationStyle.SECONDARY_GREY, height: 0),
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return ProfessionCard(snapshot.data[index]);
                      },
                    );
                  } else {
                    return _buildLoadingWidget();
                  }
                },
              ),
            ),
            Divider(color: ApplicationStyle.SECONDARY_GREY, height: 0),
            ListTile(
              title: Text("Favoritos", style: TextStyle(fontWeight: FontWeight.bold)),
              trailing: Icon(Icons.keyboard_arrow_right, color: ApplicationStyle.SECONDARY_GREEN),
            )
          ],
        ));
  }
}
