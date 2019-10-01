import 'package:callma/config/callma_config.dart';
import 'package:callma/models/professional.dart';
import 'package:callma/theme/application_style.dart';
import 'package:callma/views/scheduling/photo/photo_view.dart';
import 'package:callma/views/scheduling/details/professional_details_metrics.dart';
import 'package:callma/views/scheduling/reviews/professional_reviews.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfessionalDetailsHeader extends StatelessWidget {
  final Professional professional;

  ProfessionalDetailsHeader(this.professional);

  _buildUrl() {
    return "https://www.callma.com.br?${professional.profession.professionalClassBoardName}=${professional.professionalClassBoardId}";
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                InkWell(
                    child: Hero(
                        tag: professional.id,
                        child: CircleAvatar(
                          backgroundImage: professional.photo != null
                              ? NetworkImage(professional.photo)
                              : AssetImage(CallmaConfig.DEFAULT_PHOTO),
                          backgroundColor: Colors.transparent,
                          radius: 35,
                        )),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => PhotoView(professional)));
                    }),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      professional.name,
                      maxLines: 2,
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      professional.profession.title,
                      style: TextStyle(fontSize: 13, color: ApplicationStyle.PRIMARY_GREY),
                    ),
                    InkWell(
                      child: Text(
                        "${professional.profession.professionalClassBoardName} ${professional.professionalClassBoardId}",
                        style: TextStyle(fontSize: 13, color: ApplicationStyle.SECONDARY_BLUE),
                      ),
                      onTap: () async {
                        if (await canLaunch(_buildUrl())) {
                          await launch(_buildUrl());
                        }
                      },
                    )
                  ],
                )),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "R\$ ${professional.price.toStringAsFixed(2)}",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: ApplicationStyle.PRIMARY_GREEN),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            ProfessionalDetailsMetrics(professional),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 0),
              child: SizedBox(
                height: 26.0,
                child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.0),
                        side: BorderSide(color: ApplicationStyle.SECONDARY_GREEN)),
                    color: Colors.white,
                    textColor: ApplicationStyle.SECONDARY_GREEN,
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) => ProfessionalReviews(professional)));
                    },
                    child: Text("Avaliações")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
