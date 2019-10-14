import 'package:callma/ui/shared/custom_text.dart';
import 'package:callma/themes/callma.theme.dart';
import 'package:flutter/material.dart';

class PatientCard extends StatelessWidget {
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
                  child: CustomText(label: "Paciente"),
                ),
                SizedBox(
                  height: 20,
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0),
                          side: BorderSide(color: CallmaTheme.SECONDARY_GREEN)),
                      color: Colors.white,
                      textColor: CallmaTheme.SECONDARY_GREEN,
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