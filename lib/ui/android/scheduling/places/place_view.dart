import 'package:callma/blocs/address.bloc.dart';
import 'package:callma/blocs/appointment.bloc.dart';
import 'package:callma/blocs/user.bloc.dart';
import 'package:callma/models/address.dart';
import 'package:callma/themes/callma.theme.dart';
import 'package:callma/ui/android/scheduling/professionals/professionals_view.dart';
import 'package:callma/ui/shared/custom_app_bar.dart';
import 'package:callma/ui/shared/custom_bottom_navigation_bar.dart';
import 'package:callma/ui/shared/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlaceView extends StatelessWidget {
  final int specialtyId;

  PlaceView(this.specialtyId);

  @override
  Widget build(BuildContext context) {
    var userBloc = Provider.of<UserBloc>(context);
    var addressBloc = Provider.of<AddressBloc>(context);
    var appointmentBloc = Provider.of<AppointmentBloc>(context);

    addressBloc.getAddresses(userBloc.user.id);

    return Scaffold(
        appBar: CustomAppBar("Local da consulta"),
        bottomNavigationBar: CustomBottomNavigationBar(),
        body: SingleChildScrollView(
            child: Container(
          padding: EdgeInsets.all(10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <
                  Widget>[
            InkWell(
              child: _buildCard(
                Icons.public,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text("Consultório"),
                  ],
                ),
              ),
              onTap: () {
                appointmentBloc.setAddress(null);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ProfessionalsView(this.specialtyId)));
              },
            ),
            StreamBuilder<List<Address>>(
                stream: addressBloc.addressesStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          Address address = snapshot.data[index];

                          return InkWell(
                            child: _buildCard(
                              Icons.place,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Text("Rua ${address.address}"),
                                  Text(
                                    "${address.district} - ${address.city}/ ${address.state}",
                                    style: TextStyle(color: PRIMARY_GREY),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              appointmentBloc.setAddress(address.id);

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ProfessionalsView(this.specialtyId)));
                            },
                          );
                        });
                  } else {
                    return CustomLoading("Carregando endereços...");
                  }
                })
          ]),
        )));
  }

  Widget _buildCard(IconData icon, Widget address) {
    return Card(
      child: Container(
          padding: EdgeInsets.all(20),
          child: Row(
            children: <Widget>[
              Icon(icon, color: PRIMARY_GREEN),
              SizedBox(
                width: 20,
              ),
              Expanded(child: address),
              Icon(Icons.keyboard_arrow_right, color: PRIMARY_GREEN)
            ],
          )),
    );
  }
}
