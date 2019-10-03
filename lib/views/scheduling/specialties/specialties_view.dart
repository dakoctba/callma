import 'package:callma/blocs/specialties_bloc.dart';

import 'package:callma/theme/application_style.dart';
import 'package:callma/library/custom_app_bar.dart';
import 'package:callma/library/custom_bottom_navigation_bar.dart';
import 'package:callma/models/specialty.dart';
import 'package:callma/views/scheduling/specialties/specialty_tile.dart';
import 'package:flutter/material.dart';

class SpecialtiesView extends StatelessWidget {
  final int professionId;
  SpecialtiesView(this.professionId);

  Widget _buildLoadingWidget() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text("Carregando especialidades..."), SizedBox(height: 10), CircularProgressIndicator()],
    ));
  }

  @override
  Widget build(BuildContext context) {
    bloc.getSpecialties(professionId);

    return Scaffold(
        appBar: CustomAppBar(title: "Especialidade"),
        bottomNavigationBar: CustomBottomNavigationBar(CustomBottomNavigationBar.HOME_OPTION),
        body: Column(children: <Widget>[
          Expanded(
              child: StreamBuilder<List<Specialty>>(
                  stream: bloc.subject.stream,
                  builder: (context, AsyncSnapshot<List<Specialty>> snapshot) {
                    if (snapshot.hasData) {
                      return ListView.separated(
                          separatorBuilder: (context, index) =>
                              Divider(color: ApplicationStyle.SECONDARY_GREY, height: 0),
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return SpecialtyTile(snapshot.data[index]);
                          });
                    } else {
                      return _buildLoadingWidget();
                    }
                  }))
        ]));
  }
}
