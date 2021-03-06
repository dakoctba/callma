import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:callma/blocs/summary.bloc.dart';
import 'package:callma/helpers/professionals_helper.dart';
import 'package:callma/models/feeling.dart';
import 'package:callma/models/professional.dart';
import 'package:callma/models/summary.dart';
import 'package:callma/themes/callma.theme.dart';
import 'package:callma/ui/android/help/webview.view.dart';
import 'package:callma/ui/android/scheduling/photo/photo.view.dart';
import 'package:callma/ui/shared/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ProfessionalReviewssHeaderView extends StatefulWidget {
  final Professional professional;

  ProfessionalReviewssHeaderView(this.professional);

  @override
  _ProfessionalReviewssHeaderViewState createState() =>
      _ProfessionalReviewssHeaderViewState(this.professional);
}

class _ProfessionalReviewssHeaderViewState
    extends State<ProfessionalReviewssHeaderView> {
  final Professional professional;

  _ProfessionalReviewssHeaderViewState(this.professional);

  SummaryBloc summaryBloc;

  @override
  void initState() {
    summaryBloc = BlocProvider.getBloc<SummaryBloc>();
    super.initState();
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
                  child: InkWell(
                      child: CircleAvatar(
                        backgroundImage:
                            ProfessionalsHelper.getPhoto(professional.photo),
                        backgroundColor: Colors.transparent,
                        radius: 35,
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    PhotoView(professional.photo)));
                      }),
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
              ],
            ),
            SizedBox(height: 20),
            _metrics(context, professional)
          ],
        ),
      ),
    );
  }

  Widget _metrics(BuildContext context, Professional professional) {
    summaryBloc.getSummary(professional.id);

    return StreamBuilder<Summary>(
      stream: summaryBloc.stream,
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
                      color: PRIMARY_GREEN,
                      borderColor: TERTIARY_GREY,
                      spacing: 1.0),
                  Text("${snapshot.data.reviews} avalia????es")
                ],
              ),
              VerticalDivider(color: PRIMARY_GREY),
              Column(
                children: <Widget>[
                  _buildFeelingsChart(snapshot.data.feelings),
                ],
              ),
            ],
          ));
        } else {
          return CustomLoading("Carregando avalia????es");
        }
      },
    );
  }

  String _buildUrl(Professional professional) {
    return "https://callma.com.br?${professional.profession.professionalClassBoardName}=${professional.professionalClassBoardId}";
  }

  Widget _buildFeelingsChartItem(IconData icon, double value) {
    return Container(
      padding: EdgeInsets.all(2),
      child: Row(children: <Widget>[
        Icon(
          icon,
          color: PRIMARY_GREEN,
          size: 14,
        ),
        new LinearPercentIndicator(
          width: 140.0,
          lineHeight: 6.0,
          percent: (value / 100),
          backgroundColor: TERTIARY_GREY,
          progressColor: TERTIARY_GREEN,
        )
      ]),
    );
  }

  Widget _buildFeelingsChart(Map<String, Feeling> feelings) {
    return Column(
      children: <Widget>[
        _buildFeelingsChartItem(
            FontAwesomeIcons.grinHearts, feelings['excellent'].percent),
        _buildFeelingsChartItem(
            FontAwesomeIcons.smileBeam, feelings['great'].percent),
        _buildFeelingsChartItem(
            FontAwesomeIcons.meh, feelings['average'].percent),
        _buildFeelingsChartItem(
            FontAwesomeIcons.frownOpen, feelings['poor'].percent),
        _buildFeelingsChartItem(
            FontAwesomeIcons.angry, feelings['bad'].percent),
      ],
    );
  }
}
