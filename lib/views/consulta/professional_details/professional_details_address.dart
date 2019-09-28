import 'package:callma/library/custom_text.dart';
import 'package:callma/models/clinic.dart';
import 'package:callma/theme/application_style.dart';
import 'package:flutter/material.dart';

class ProfessionalDetailsAddress extends StatelessWidget {
  final List<Clinic> _clinics;

  ProfessionalDetailsAddress(this._clinics);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                CustomText(label: "Endereço do consultório"),
                SizedBox(height: 10),
                ListView.separated(
                  itemCount: _clinics.length,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(_clinics[index].address),
                        Text("${_clinics[index].district} - ${_clinics[index].city}/ ${_clinics[index].state}"),
                        Text(_clinics[index].zipcode),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => Divider(color: ApplicationStyle.SECONDARY_GREY, height: 20),
                )
              ],
            )));
  }
}
