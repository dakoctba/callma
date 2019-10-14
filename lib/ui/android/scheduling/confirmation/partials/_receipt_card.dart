import 'package:callma/blocs/appointment.bloc.dart';
import 'package:callma/ui/shared/custom_text.dart';
import 'package:callma/themes/callma.theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReceiptCard extends StatefulWidget {
  @override
  _ReceiptCardState createState() => _ReceiptCardState();
}

class _ReceiptCardState extends State<ReceiptCard> {
  bool option = false;

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<AppointmentBloc>(context);

    return Card(
      child: Container(
          padding: EdgeInsets.all(20),
          child: Row(
            children: <Widget>[
              Expanded(
                child: CustomText(label: "Quero o recibo médico"),
              ),
              Switch(
                  value: option,
                  activeColor: CallmaTheme.PRIMARY_GREEN,
                  inactiveTrackColor: CallmaTheme.SECONDARY_GREY,
                  onChanged: (value) {
                    setState(() {
                      option = value;
                    });
                    bloc.receipt = value;
                  })
            ],
          )),
    );
  }
}
