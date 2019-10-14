import 'package:callma/blocs/specialty.bloc.dart';
import 'package:callma/models/specialty.dart';
import 'package:callma/themes/callma.theme.dart';
import 'package:callma/ui/android/scheduling/specialties/specialty_tile.dart';
import 'package:callma/ui/shared/custom_app_bar.dart';
import 'package:callma/ui/shared/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SpecialtiesView extends StatelessWidget {
  final int professionId;
  SpecialtiesView(this.professionId);

  Widget _buildLoadingWidget() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Carregando especialidades..."),
        SizedBox(height: 10),
        CircularProgressIndicator()
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    final specialtyBloc = Provider.of<SpecialtyBloc>(context);
    specialtyBloc.getSpecialties(professionId);

    return Scaffold(
        appBar: CustomAppBar(title: "Especialidade"),
        bottomNavigationBar: CustomBottomNavigationBar(),
        body: Column(children: <Widget>[
          Expanded(
              child: StreamBuilder<List<Specialty>>(
                  stream: specialtyBloc.stream,
                  builder: (context, AsyncSnapshot<List<Specialty>> snapshot) {
                    if (snapshot.hasData) {
                      return ListView.separated(
                          separatorBuilder: (context, index) =>
                              Divider(color: SECONDARY_GREY, height: 0),
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
