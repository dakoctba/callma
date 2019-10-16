import 'package:callma/models/clinic.dart';
import 'package:callma/themes/callma.theme.dart';
import 'package:callma/ui/shared/custom_text.dart';
import 'package:flutter/material.dart';

class ClinicsCardView extends StatelessWidget {
  final List<Clinic> clinics;
  final int selectedClinic;
  final Function(int) onTap;

  ClinicsCardView(this.clinics, this.selectedClinic, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                CustomText(
                    clinics.length == 1 ? "Endereço da clínica" : "Clínicas"),
                SizedBox(height: 10),
                ListView.separated(
                  itemCount: clinics.length,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    Clinic clinic = clinics[index];
                    return _buildCard(context, clinic);
                  },
                  separatorBuilder: (context, index) =>
                      Divider(color: TERTIARY_GREY, height: 20),
                )
              ],
            )));
  }

  InkWell _buildCard(BuildContext context, Clinic clinic) {
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
          selectedClinic == clinic.id
              ? Icon(Icons.check_circle, color: PRIMARY_GREEN)
              : Container()
        ],
      ),
      onTap: () {
        onTap(clinic.id);
      },
    );
  }
}
