import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:callma/blocs/professional.bloc.dart';
import 'package:callma/blocs/user.bloc.dart';
import 'package:callma/models/professional.dart';
import 'package:callma/themes/callma.theme.dart';
import 'package:callma/ui/android/scheduling/filters/filters.view.dart';
import 'package:callma/ui/android/scheduling/professionals/partials/_professional_card.view.dart';
import 'package:callma/ui/shared/custom_app_bar.dart';
import 'package:callma/ui/shared/custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:callma/ui/shared/custom_loading.dart';
import 'package:flutter/material.dart';

class ProfessionalsView extends StatefulWidget {
  final int specialtyId;
  ProfessionalsView(this.specialtyId);

  @override
  _ProfessionalsViewState createState() => _ProfessionalsViewState(specialtyId);
}

class _ProfessionalsViewState extends State<ProfessionalsView> {
  ProfessionalBloc professionalBloc;
  UserBloc userBloc;
  final int specialtyId;

  _ProfessionalsViewState(this.specialtyId);

  @override
  void initState() {
    professionalBloc = BlocProvider.getBloc<ProfessionalBloc>();
    userBloc = BlocProvider.getBloc<UserBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var sex = userBloc.user.profiles[0].sex;

    professionalBloc.getProfessionals(sex, specialtyId);

    return Scaffold(
        appBar: CustomAppBar("Profissionais"),
        bottomNavigationBar: CustomBottomNavigationBar(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.search),
          backgroundColor: PRIMARY_GREEN,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => FiltersView()));
          },
        ),
        body: Container(
          padding: EdgeInsets.all(5),
          child: StreamBuilder<List<Professional>>(
              stream: professionalBloc.stream,
              builder: (context, AsyncSnapshot<List<Professional>> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data.length == 0) {
                    return Card(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Text(
                            "Ops! Ainda não temos nenhum profissional nessa especialidade"),
                      ),
                    );
                  }

                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return ProfessionalCardView(snapshot.data[index]);
                      });
                } else {
                  return CustomLoading("Carregando profissionais");
                }
              }),
        ));
  }
}
