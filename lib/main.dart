import 'package:flutter/material.dart';

import 'modules/consulta/screens/ProfessionsScreen.dart';

void main() => runApp(CallmaApp());

class CallmaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Callma',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: ProfessionsScreen()
    );
  }
}

//class App extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        appBar: CallmaAppBar("Profissional"),
//        bottomNavigationBar: CallmaBottomNavigationBar(CallmaBottomNavigationBar.HOME_OPTION),
//        body: Container(
//            color: Colors.white,
//            child: ProfessionsScreen()
//        )
//    );
//  }
//}