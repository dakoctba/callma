import 'package:flutter/material.dart';

import 'modules/login/screens/LoginScreen.dart';

void main() => runApp(CallmaApp());

class CallmaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Callma',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: LoginScreen()
    );
  }
}
