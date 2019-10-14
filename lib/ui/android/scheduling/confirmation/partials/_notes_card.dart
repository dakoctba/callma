import 'package:callma/blocs/appointment.bloc.dart';
import 'package:callma/ui/shared/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotesCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<AppointmentBloc>(context);

    return Card(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            CustomText(label: "Observações ao profissional"),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(border: OutlineInputBorder()),
              maxLines: 3,
              onChanged: (notes) {
                bloc.changeNotes(notes);
              },
            )
          ],
        ),
      ),
    );
  }
}
