import 'package:callma/helpers/professionals_helper.dart';
import 'package:callma/models/feeling.dart';
import 'package:callma/models/professional.dart';
import 'package:callma/models/summary.dart';
import 'package:callma/theme/application_style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:callma/controllers/summaries_controller.dart';

class ProfessionalReviewssHeader extends StatelessWidget {
  final Professional professional;

  ProfessionalReviewssHeader(this.professional);

  _buildUrl() {
    return "https://www.callma.com.br?${professional.profession.professionalClassBoardName}=${professional.professionalClassBoardId}";
  }

  Widget _buildLoadingWidget() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text("Carregando avaliações..."), SizedBox(height: 10), CircularProgressIndicator()],
    ));
  }

  _buildFeelingsChartItem(IconData icon, double value) {
    return Container(
      padding: EdgeInsets.all(2),
      child: Row(children: <Widget>[
        Icon(
          icon,
          color: ApplicationStyle.PRIMARY_GREEN,
          size: 14,
        ),
        new LinearPercentIndicator(
          width: 140.0,
          lineHeight: 6.0,
          percent: (value / 100),
          backgroundColor: ApplicationStyle.TERTIARY_GREY,
          progressColor: ApplicationStyle.TERTIARY_GREEN,
        )
      ]),
    );
  }

  _buildFeelingsChart(Map<String, Feeling> feelings) {
    return Column(
      children: <Widget>[
        _buildFeelingsChartItem(FontAwesomeIcons.grinHearts, feelings['excellent'].percent),
        _buildFeelingsChartItem(FontAwesomeIcons.smileBeam, feelings['great'].percent),
        _buildFeelingsChartItem(FontAwesomeIcons.meh, feelings['average'].percent),
        _buildFeelingsChartItem(FontAwesomeIcons.frownOpen, feelings['poor'].percent),
        _buildFeelingsChartItem(FontAwesomeIcons.angry, feelings['bad'].percent),
      ],
    );
  }

  _metrics(BuildContext context) {
    final summariesController = Provider.of<SummariesController>(context);
    summariesController.getSummary(professional.id);

    return StreamBuilder<Summary>(
      stream: summariesController.stream,
      builder: (context, AsyncSnapshot<Summary> snapshot) {
        if (snapshot.hasData) {
          return IntrinsicHeight(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "${snapshot.data.average.toStringAsFixed(1)}",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SmoothStarRating(
                      allowHalfRating: false,
                      starCount: 5,
                      rating: snapshot.data.average,
                      size: 16,
                      color: ApplicationStyle.PRIMARY_GREEN,
                      borderColor: ApplicationStyle.SECONDARY_GREY,
                      spacing: 1.0),
                  Text("${snapshot.data.reviews} avaliações")
                ],
              ),
              VerticalDivider(color: ApplicationStyle.PRIMARY_GREY),
              Column(
                children: <Widget>[
                  _buildFeelingsChart(snapshot.data.feelings),
                ],
              ),
            ],
          ));
        } else {
          return _buildLoadingWidget();
        }
      },
    );
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
                    backgroundImage: ProfessionalsHelper.getPhoto(professional.photo),
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
            _metrics(context)
          ],
        ),
      ),
    );
  }
}