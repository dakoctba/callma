import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import 'package:callma/config/callma_config.dart';
import 'package:callma/models/professional.dart';
import 'package:callma/theme/application_style.dart';
import 'package:callma/views/consulta/professional_details/professional_details_view.dart';

class ProfessionalTile extends ListTile {
  final Professional professional;

  ProfessionalTile(this.professional);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: CircleAvatar(
          backgroundImage:
              professional.photo != null ? NetworkImage(professional.photo) : AssetImage(CallmaConfig.DEFAULT_PHOTO),
          backgroundColor: Colors.transparent,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(professional.name),
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SmoothStarRating(
                    allowHalfRating: false,
                    starCount: 5,
                    rating: 5,
                    size: 16,
                    color: ApplicationStyle.PRIMARY_GREEN,
                    borderColor: ApplicationStyle.PRIMARY_GREY,
                    spacing: 1.0),
                Text('R\$ 150,00', style: TextStyle(fontSize: 12)),
                Text(
                  '8km',
                  style: TextStyle(fontSize: 12),
                  textAlign: TextAlign.right,
                ),
              ],
            )
          ],
        ),
        trailing: Icon(Icons.keyboard_arrow_right, color: ApplicationStyle.SECONDARY_GREEN),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfessionalDetailsView()));
        });
  }
}
