import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:callma/blocs/specialty.bloc.dart';
import 'package:callma/models/specialty.dart';
import 'package:callma/themes/callma.theme.dart';
import 'package:callma/ui/android/scheduling/places/place.view.dart';
import 'package:callma/ui/shared/custom_app_bar.dart';
import 'package:callma/ui/shared/custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:callma/ui/shared/custom_loading.dart';
import 'package:flutter/material.dart';

class SpecialtiesView extends StatefulWidget {
  final int professionId;

  SpecialtiesView(this.professionId);

  @override
  _SpecialtiesViewState createState() => _SpecialtiesViewState(professionId);
}

class _SpecialtiesViewState extends State<SpecialtiesView> {
  SpecialtyBloc specialtyBloc;
  final int professionId;

  _SpecialtiesViewState(this.professionId);

  @override
  void initState() {
    specialtyBloc = BlocProvider.getBloc<SpecialtyBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    specialtyBloc.getSpecialties(professionId);

    return Scaffold(
        appBar: CustomAppBar("Especialidade"),
        bottomNavigationBar: CustomBottomNavigationBar(),
        body: Column(children: <Widget>[
          Expanded(
              child: StreamBuilder<List<Specialty>>(
                  stream: specialtyBloc.stream,
                  builder: (context, AsyncSnapshot<List<Specialty>> snapshot) {
                    if (snapshot.hasData) {
                      return ListView.separated(
                          separatorBuilder: (context, index) =>
                              Divider(color: TERTIARY_GREY, height: 0),
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
