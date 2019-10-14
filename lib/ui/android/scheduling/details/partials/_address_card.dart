import 'package:callma/blocs/appointment.bloc.dart';
import 'package:callma/models/clinic.dart';
import 'package:callma/models/professional.dart';
import 'package:callma/themes/callma.theme.dart';
import 'package:callma/ui/shared/custom_text.dart';
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
                    Clinic clinic = professional.clinics[index];
                    return _buildCard(context, clinic);
                  },
                  separatorBuilder: (context, index) =>
                      Divider(color: SECONDARY_GREY, height: 20),
                )
              ],
            )));
  }

  InkWell _buildCard(BuildContext context, Clinic clinic) {
    var appointmentBloc = Provider.of<AppointmentBloc>(context);

    return InkWell(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(clinic.address),
                Text("${clinic.district} - ${clinic.city}/ ${clinic.state}"),
                Text(clinic.zipcode),
              ],
            ),
          ),
          appointmentBloc.clinicId == clinic.id
              ? Icon(Icons.done, color: PRIMARY_GREEN)
              : Container()
        ],
      ),
      onTap: () {
        appointmentBloc.setClinicId(clinic.id);
      },
    );
  }
}
