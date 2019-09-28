import 'package:callma/config/callma_config.dart';
import 'package:callma/models/professional.dart';
import 'package:callma/theme/application_style.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfessionalReviewssHeader extends StatelessWidget {
  final Professional professional;

  ProfessionalReviewssHeader(this.professional);

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
                Hero(
                  tag: professional.id,
                  child: CircleAvatar(
                    backgroundImage: professional.photo != null
                        ? NetworkImage(professional.photo)
                        : AssetImage(CallmaConfig.DEFAULT_PHOTO),
                    backgroundColor: Colors.transparent,
                    radius: 35,
                  ),
                ),
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
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: <Widget>[Text("Estrelas"), Text("Avaliações")],
            ),
          ],
        ),
      ),
    );
  }
}
