import 'package:callma/ui/shared/custom_text.dart';
import 'package:callma/themes/callma.theme.dart';
import 'package:flutter/material.dart';

class PatientCardView extends StatefulWidget {
  @override
  _PatientCardViewState createState() => _PatientCardViewState();
}

class _PatientCardViewState extends State<PatientCardView> {
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
                  child: CustomText("Paciente"),
                ),
                SizedBox(
                  height: 20,
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0),
                          side: BorderSide(color: SECONDARY_GREEN)),
                      color: Colors.white,
                      textColor: SECONDARY_GREEN,
                      onPressed: () {},
                      child: Text("Alterar")),
                )
              ],
            ),
            SizedBox(height: 20),
            Text("John Doe")
          ],
        ),
      ),
    );
  }
}
