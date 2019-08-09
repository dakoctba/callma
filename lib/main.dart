import 'package:flutter/material.dart';

import 'components/bars/CallmaAppBar.dart';
import 'components/bars/CallmaBottomNavigationBar.dart';
import 'package:callma/modules/consulta/screens/ProfessionsScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Callma',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: App()
    );
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CallmaAppBar("Agendamento de consulta - Profissional"),
        bottomNavigationBar: CallmaBottomNavigationBar(CallmaBottomNavigationBar.HOME_OPTION),
        body: Container(
            color: Colors.white,
            child: ProfessionsScreen()
        )
    );
  }
}