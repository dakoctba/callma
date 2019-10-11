import 'package:callma/controllers/appointments_controller.dart';
import 'package:callma/helpers/professionals_helper.dart';
import 'package:callma/models/professional.dart';
import 'package:callma/theme/application_style.dart';
import 'package:callma/views/scheduling/details/partials/_metrics_card.dart';
import 'package:callma/views/scheduling/photo/photo_view.dart';
import 'package:callma/views/scheduling/reviews/reviews_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HeaderCard extends StatelessWidget {
  String _buildUrl(Professional professional) {
    return "https://www.callma.com.br?${professional.profession.professionalClassBoardName}=${professional.professionalClassBoardId}";
  }

  @override
  Widget build(BuildContext context) {
    var appointmentsController = Provider.of<AppointmentsController>(context);

    return StreamBuilder<Professional>(
        stream: appointmentsController.professionalStream,
        builder: (context, AsyncSnapshot<Professional> snapshot) {
          if (!snapshot.hasData) {
            return Text("Carregando...");
          }

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
                              tag: snapshot.data.id,
                              child: CircleAvatar(
                                backgroundImage: ProfessionalsHelper.getPhoto(snapshot.data.photo),
                                backgroundColor: Colors.transparent,
                                radius: 35,
                              )),
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) => PhotoView(snapshot.data.photo)));
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
                            snapshot.data.name,
                            maxLines: 2,
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            snapshot.data.profession.title,
                            style: TextStyle(fontSize: 13, color: ApplicationStyle.PRIMARY_GREY),
                          ),
                          InkWell(
                            child: Text(
                              "${snapshot.data.profession.professionalClassBoardName} ${snapshot.data.professionalClassBoardId}",
                              style: TextStyle(fontSize: 13, color: ApplicationStyle.SECONDARY_BLUE),
                            ),
                            onTap: () async {
                              if (await canLaunch(_buildUrl(snapshot.data))) {
                                await launch(_buildUrl(snapshot.data));
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
                            "R\$ ${snapshot.data.price.toStringAsFixed(2)}",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold, color: ApplicationStyle.PRIMARY_GREEN),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  MetricsCard(),
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
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ReviewsView()));
                          },
                          child: Text("Avaliações")),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
