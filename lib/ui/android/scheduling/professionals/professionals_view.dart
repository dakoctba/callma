import 'package:callma/blocs/professional.bloc.dart';
import 'package:callma/blocs/user.bloc.dart';
import 'package:callma/models/professional.dart';
import 'package:callma/themes/callma.theme.dart';
import 'package:callma/ui/android/scheduling/filters/filters_view.dart';
import 'package:callma/ui/android/scheduling/professionals/partials/_professional_card.dart';
import 'package:callma/ui/shared/custom_app_bar.dart';
import 'package:callma/ui/shared/custom_bottom_navigation_bar.dart';
import 'package:callma/ui/shared/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfessionalsView extends StatelessWidget {
  final int specialtyId;
  ProfessionalsView(this.specialtyId);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<ProfessionalBloc>(context);

    var userBloc = Provider.of<UserBloc>(context);
    var sex = userBloc.user.profiles[0].sex;

    bloc.getProfessionals(sex, specialtyId);

    return Scaffold(
        appBar: CustomAppBar(title: "Profissionais"),
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
          padding: EdgeInsets.all(10),
          child: StreamBuilder<List<Professional>>(
              stream: bloc.stream,
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
                        return ProfessionalCard(snapshot.data[index]);
                      });
                } else {
                  return CustomLoading("Carregando profissionais");
                }
              }),
        ));
  }
}
