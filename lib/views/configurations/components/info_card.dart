import 'package:callma/blocs/login_bloc.dart';
import 'package:callma/helpers/professionals_helper.dart';
import 'package:callma/models/profile.dart';
import 'package:callma/models/user.dart';
import 'package:callma/views/scheduling/photo/photo_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InfoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var userBloc = Provider.of<LoginBloc>(context);

    return StreamBuilder<User>(
      stream: userBloc.saida,
      builder: (context, AsyncSnapshot<User> snapshot) {
        if (snapshot.hasData) {
          User user = snapshot.data;
          Profile profile = user.profiles[0];

          return Card(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  InkWell(
                      child: CircleAvatar(
                        backgroundImage: ProfessionalsHelper.getPhoto(profile.photo),
                        backgroundColor: Colors.transparent,
                        radius: 30,
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => PhotoView(profile.photo)));
                      }),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(profile.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
        } else {
          return Text("Nada ainda");
        }
      },
    );
  }
}
