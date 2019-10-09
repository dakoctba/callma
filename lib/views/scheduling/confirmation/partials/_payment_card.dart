import 'package:callma/library/custom_text.dart';
import 'package:callma/theme/application_style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PaymentCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: CustomText(label: "Método de pagamento"),
                ),
                SizedBox(
                  height: 20,
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0),
                          side: BorderSide(color: ApplicationStyle.SECONDARY_GREEN)),
                      color: Colors.white,
                      textColor: ApplicationStyle.SECONDARY_GREEN,
                      onPressed: () {},
                      child: Text("Alterar")),
                )
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: <Widget>[Icon(FontAwesomeIcons.ccVisa), SizedBox(width: 10), Text("**** **** **** 1234")],
            )
          ],
        ),
      ),
    );
  }
}
