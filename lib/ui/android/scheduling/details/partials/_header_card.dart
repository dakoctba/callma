import 'package:callma/blocs/appointment.bloc.dart';
import 'package:callma/helpers/professionals_helper.dart';
import 'package:callma/models/professional.dart';
import 'package:callma/themes/callma.theme.dart';
import 'package:callma/ui/android/scheduling/details/partials/_metrics_card.dart';
import 'package:callma/ui/android/scheduling/photo/photo_view.dart';
import 'package:callma/ui/android/scheduling/reviews/reviews_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HeaderCard extends StatelessWidget {
  String _buildUrl(Professional professional) {
    return "https://www.callma.com.br?${professional.profession.professionalClassBoardName}=${professional.professionalClassBoardId}";
  }

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<AppointmentBloc>(context);

    Professional professional = bloc.professional;

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
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PhotoView(professional.photo)));
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
                      style: TextStyle(
                          fontSize: 13, color: CallmaTheme.PRIMARY_GREY),
                    ),
                    InkWell(
                      child: Text(
                        "${professional.profession.professionalClassBoardName} ${professional.professionalClassBoardId}",
                        style: TextStyle(
                            fontSize: 13, color: CallmaTheme.SECONDARY_BLUE),
                      ),
                      onTap: () async {
                        if (await canLaunch(_buildUrl(professional))) {
                          await launch(_buildUrl(professional));
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
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: CallmaTheme.PRIMARY_GREEN),
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
                        side: BorderSide(color: CallmaTheme.SECONDARY_GREEN)),
                    color: Colors.white,
                    textColor: CallmaTheme.SECONDARY_GREEN,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ReviewsView()));
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
