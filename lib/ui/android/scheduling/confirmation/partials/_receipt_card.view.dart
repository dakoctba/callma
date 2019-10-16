import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:callma/blocs/appointment.bloc.dart';
import 'package:callma/themes/callma.theme.dart';
import 'package:callma/ui/shared/custom_text.dart';
import 'package:flutter/material.dart';

class ReceiptCardView extends StatefulWidget {
  @override
  _ReceiptCardViewState createState() => _ReceiptCardViewState();
}

class _ReceiptCardViewState extends State<ReceiptCardView> {
  AppointmentBloc appointmentBloc;
  bool option = false;

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
          child: Row(
            children: <Widget>[
              Expanded(
                child: CustomText("Desejo receber o recibo médico"),
              ),
              Switch(
                  value: option,
                  activeColor: PRIMARY_GREEN,
                  inactiveTrackColor: SECONDARY_GREY,
                  onChanged: (value) {
                    setState(() {
                      option = value;
                    });
                    appointmentBloc.changeReceipt(value);
                  })
            ],
          )),
    );
  }
}
