import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:callma/blocs/user.bloc.dart';
import 'package:callma/helpers/professionals_helper.dart';
import 'package:callma/models/profile.dart';
import 'package:callma/models/user.dart';
import 'package:callma/ui/android/scheduling/photo/photo.view.dart';
import 'package:flutter/material.dart';

class InfoCard extends StatefulWidget {
  @override
  _InfoCardState createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  UserBloc userBloc;

  @override
  void initState() {
    userBloc = BlocProvider.getBloc<UserBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    User user = userBloc.user;

    if (user == null) {
      return Text("Usuário não logado");
    }

    Profile profile = user.profiles[0];

    return Card(
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Row(
          children: <Widget>[
            InkWell(
                child: CircleAvatar(
                  backgroundImage: ProfessionalsHelper.getPhoto(profile.photo),
                  backgroundColor: Colors.transparent,
                  radius: 30,
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PhotoView(profile.photo)));
                }),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(profile.name,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
