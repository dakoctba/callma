import 'package:callma/blocs/professional.bloc.dart';
import 'package:callma/models/professional.dart';
import 'package:callma/themes/callma.theme.dart';
import 'package:callma/ui/android/scheduling/filters/filters_view.dart';
import 'package:callma/ui/android/scheduling/professionals/partials/_professional_card.dart';
import 'package:callma/ui/shared/custom_app_bar.dart';
import 'package:callma/ui/shared/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfessionalsView extends StatelessWidget {
  final int specialtyId;
  ProfessionalsView(this.specialtyId);

  Widget _buildLoadingWidget() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Carregando profissionais..."),
        SizedBox(height: 10),
        CircularProgressIndicator()
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<ProfessionalBloc>(context);

    bloc.getProfessionals("M", specialtyId); // TODO HARDCODE

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
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return ProfessionalCard(snapshot.data[index]);
                      });
                } else {
                  return _buildLoadingWidget();
                }
              }),
        ));
  }
}
