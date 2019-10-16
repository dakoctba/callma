import 'package:callma/models/address.dart';
import 'package:callma/ui/shared/custom_text.dart';
import 'package:flutter/material.dart';

class AddressCardView extends StatefulWidget {
  final Address address;

  AddressCardView(this.address);

  @override
  _AddressCardViewState createState() => _AddressCardViewState(this.address);
}

class _AddressCardViewState extends State<AddressCardView> {
  Address address;

  _AddressCardViewState(this.address);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            CustomText("Consulta em domicílio"),
            SizedBox(height: 10),
            Text("Rua ${address.address}"),
            Text("${address.district} - ${address.city}/ ${address.state}")
          ],
        ),
      ),
    );
  }
}
