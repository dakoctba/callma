import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:callma/blocs/profession.bloc.dart';
import 'package:callma/models/profession.dart';
import 'package:callma/themes/callma.theme.dart';
import 'package:callma/ui/android/scheduling/specialties/specialties.view.dart';
import 'package:callma/ui/shared/custom_app_bar.dart';
import 'package:callma/ui/shared/custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:callma/ui/shared/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfessionsView extends StatefulWidget {
  @override
  _ProfessionsViewState createState() => _ProfessionsViewState();
}

class _ProfessionsViewState extends State<ProfessionsView> {
  ProfessionBloc professionBloc;

  @override
  void initState() {
    professionBloc = BlocProvider.getBloc<ProfessionBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    professionBloc.getProfessions();

    var professionIcons = Map<int, IconData>();
    professionIcons[1] = Icons.fitness_center;
    professionIcons[2] = FontAwesomeIcons.userNurse;
    professionIcons[3] = FontAwesomeIcons.userInjured;
    professionIcons[4] = Icons.record_voice_over;
    professionIcons[5] = Icons.fastfood;
    professionIcons[6] = FontAwesomeIcons.users;
    professionIcons[7] = FontAwesomeIcons.accessibleIcon;

    return Scaffold(
        appBar: CustomAppBar("Profissão"),
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
                          Divider(color: TERTIARY_GREY, height: 0),
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return _buildProfessionTile(context,
                            snapshot.data[index], professionIcons[index + 1]);
                      },
                    );
                  } else {
                    return CustomLoading("Carregando profissões...");
                  }
                },
              ),
            ),
            Divider(color: TERTIARY_GREY, height: 0),
            ListTile(
              title: Text("Favoritos",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              trailing:
                  Icon(Icons.keyboard_arrow_right, color: SECONDARY_GREEN),
            )
          ],
        ));
  }

  ListTile _buildProfessionTile(
      BuildContext context, Profession profession, IconData icon) {
    return ListTile(
        leading: Icon(icon, color: PRIMARY_GREEN),
        title: Text(profession.title),
        subtitle:
            profession.subtitle != null ? Text(profession.subtitle) : null,
        trailing:
            const Icon(Icons.keyboard_arrow_right, color: SECONDARY_GREEN),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SpecialtiesView(profession.id)));
        });
  }
}
