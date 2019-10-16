import 'package:callma/helpers/professionals_helper.dart';
import 'package:callma/models/professional.dart';
import 'package:callma/themes/callma.theme.dart';
import 'package:callma/ui/android/help/webview.view.dart';
import 'package:callma/ui/android/scheduling/details/partials/_metrics_card.view.dart';
import 'package:callma/ui/android/scheduling/photo/photo.view.dart';
import 'package:callma/ui/android/scheduling/reviews/reviews.view.dart';
import 'package:flutter/material.dart';

class HeaderCardView extends StatelessWidget {
  final Professional professional;

  HeaderCardView(this.professional);

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
                          backgroundImage:
                              ProfessionalsHelper.getPhoto(professional.photo),
                          backgroundColor: Colors.transparent,
                          radius: 35,
                        )),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PhotoView(professional.photo)));
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
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      professional.profession.title,
                      style: TextStyle(fontSize: 13, color: PRIMARY_GREY),
                    ),
                    InkWell(
                      child: Text(
                        "${professional.profession.professionalClassBoardName} ${professional.professionalClassBoardId}",
                        style: TextStyle(fontSize: 13, color: SECONDARY_BLUE),
                      ),
                      onTap: () {
                        Navigator.push(
                            (context),
                            MaterialPageRoute(
                                builder: (context) =>
                                    WebviewView(_buildUrl(professional))));
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
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: PRIMARY_GREEN),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            MetricsCardView(professional),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 0),
              child: SizedBox(
                height: 26.0,
                child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.0),
                        side: BorderSide(color: SECONDARY_GREEN)),
                    color: Colors.white,
                    textColor: SECONDARY_GREEN,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ReviewsView(professional)));
                    },
                    child: Text("Avaliações")),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _buildUrl(Professional professional) {
    String boardClass = professional.profession.professionalClassBoardName;
    String boardId = professional.professionalClassBoardId;

    return "https://callma.com.br?${boardClass}=${boardId}";
  }
}
