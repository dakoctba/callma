import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:callma/blocs/appointment.bloc.dart';
import 'package:callma/ui/shared/custom_text.dart';
import 'package:flutter/material.dart';

class NotesCardView extends StatefulWidget {
  @override
  _NotesCardViewState createState() => _NotesCardViewState();
}

class _NotesCardViewState extends State<NotesCardView> {
  AppointmentBloc appointmentBloc;

  @override
  void initState() {
    appointmentBloc = BlocProvider.getBloc<AppointmentBloc>();
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
            CustomText("Observações ao profissional"),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(border: OutlineInputBorder()),
              maxLines: 3,
              onChanged: (notes) {
                appointmentBloc.changeNotes(notes);
              },
            )
          ],
        ),
      ),
    );
  }
}
