import 'package:callma/controllers/appointments_controller.dart';
import 'package:callma/library/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotesCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appointmentsController = Provider.of<AppointmentsController>(context);

    return Card(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            CustomText(label: "Observações ao profissional"),
            SizedBox(height: 20),
            StreamBuilder<String>(
                stream: appointmentsController.notesStream,
                builder: (context, AsyncSnapshot<String> snapshot) {
                  return TextField(
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    maxLines: 3,
                    onChanged: (notes) {
                      appointmentsController.setNotes(notes);
                    },
                  );
                }),
          ],
        ),
      ),
    );
  }
}
