import 'package:callma/blocs/appointment.bloc.dart';
import 'package:callma/ui/shared/custom_text.dart';
import 'package:callma/models/professional.dart';
import 'package:callma/themes/callma.theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddressCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<AppointmentBloc>(context);

    Professional professional = bloc.professional;

    return Card(
        child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                CustomText(label: "Endereço do consultório"),
                SizedBox(height: 10),
                ListView.separated(
                  itemCount: professional.clinics.length,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(professional.clinics[index].address),
                        Text(
                            "${professional.clinics[index].district} - ${professional.clinics[index].city}/ ${professional.clinics[index].state}"),
                        Text(professional.clinics[index].zipcode),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) =>
                      Divider(color: CallmaTheme.SECONDARY_GREY, height: 20),
                )
              ],
            )));
  }
}
