import 'package:callma/controllers/appointments_controller.dart';
import 'package:callma/controllers/professionals_controller.dart';
import 'package:callma/views/scheduling/professionals/partials/_professional_card.dart';
import 'package:flutter/material.dart';

import 'package:callma/theme/application_style.dart';
import 'package:callma/library/custom_app_bar.dart';
import 'package:callma/library/custom_bottom_navigation_bar.dart';
import 'package:callma/models/professional.dart';
import 'package:callma/views/scheduling/filters/filters_view.dart';
import 'package:provider/provider.dart';

class ProfessionalsView extends StatelessWidget {
  final int specialtyId;
  ProfessionalsView(this.specialtyId);

  Widget _buildLoadingWidget() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text("Carregando profissionais..."), SizedBox(height: 10), CircularProgressIndicator()],
    ));
  }

  @override
  Widget build(BuildContext context) {
    final professionalsController = Provider.of<ProfessionalsController>(context);
    final appointmentsController = Provider.of<AppointmentsController>(context);

    String sex = appointmentsController.user.profiles[0].sex;

    professionalsController.getProfessionals(sex, specialtyId);

    return Scaffold(
        appBar: CustomAppBar(title: "Profissionais"),
        bottomNavigationBar: CustomBottomNavigationBar(CustomBottomNavigationBar.HOME_OPTION),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.search),
          backgroundColor: ApplicationStyle.PRIMARY_GREEN,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => FiltersView()));
          },
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: StreamBuilder<List<Professional>>(
              stream: professionalsController.stream,
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
