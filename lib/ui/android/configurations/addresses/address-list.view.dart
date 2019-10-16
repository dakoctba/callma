import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:callma/blocs/address.bloc.dart';
import 'package:callma/models/address.dart';
import 'package:callma/themes/callma.theme.dart';
import 'package:callma/ui/shared/custom_app_bar.dart';
import 'package:callma/ui/shared/custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:callma/ui/shared/custom_loading.dart';
import 'package:flutter/material.dart';

class AddressListView extends StatefulWidget {
  @override
  _AddressListViewState createState() => _AddressListViewState();
}

class _AddressListViewState extends State<AddressListView> {
  AddressBloc addressBloc;

  @override
  void initState() {
    addressBloc = BlocProvider.getBloc<AddressBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    addressBloc.getAddresses(1);

    return Scaffold(
      appBar: CustomAppBar("Meus endereços"),
      body: StreamBuilder<List<Address>>(
        stream: addressBloc.addressesStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return _buildCard(snapshot.data[index]);
                });
          } else {
            return CustomLoading("Carregando endereços...");
          }
        },
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }

  Widget _buildCard(Address address) {
    return Card(
      child: Container(
          padding: EdgeInsets.all(20),
          child: Row(
            children: <Widget>[
              Icon(Icons.place, color: PRIMARY_GREEN),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
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
              Icon(Icons.keyboard_arrow_right, color: PRIMARY_GREEN)
            ],
          )),
    );
  }
}
