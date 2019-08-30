import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://firebasestorage.googleapis.com/v0/b/callma.appspot.com/o/adroaldo.png?alt=media&token=5dd9701f-b473-45cc-81e7-0d51d39c2874"))),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Adroaldo Rodrigues Santos",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Row(children: <Widget>[
                    Text("Você tem "),
                    Text("650 ", style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("pontos"),
                  ])
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
