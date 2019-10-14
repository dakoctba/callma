import 'package:callma/blocs/specialty.bloc.dart';
import 'package:callma/models/specialty.dart';
import 'package:callma/themes/callma.theme.dart';
import 'package:callma/ui/android/scheduling/places/place_view.dart';
import 'package:callma/ui/shared/custom_app_bar.dart';
import 'package:callma/ui/shared/custom_bottom_navigation_bar.dart';
import 'package:callma/ui/shared/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SpecialtiesView extends StatelessWidget {
  final int professionId;

  SpecialtiesView(this.professionId);

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
                            return _buildSpecialtyTile(
                                context, snapshot.data[index]);
                          });
                    } else {
                      return CustomLoading("Carregando especialidades");
                    }
                  }))
        ]));
  }

  ListTile _buildSpecialtyTile(BuildContext context, Specialty specialty) {
    return ListTile(
        title: Text(specialty.title),
        subtitle: specialty.subtitle != null ? Text(specialty.subtitle) : null,
        trailing:
            const Icon(Icons.keyboard_arrow_right, color: SECONDARY_GREEN),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => PlaceView(specialty.id)));
        });
  }
}
