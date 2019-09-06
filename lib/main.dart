import 'package:flutter/material.dart';

import 'components/CallmaColors.dart';
import 'modules/login/screens/LoginScreen.dart';

void main() => runApp(CallmaApp());

class CallmaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Callma',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: CallmaColors.VERDE_ESCURO))
          )
      ),
      home: LoginScreen()
    );
  }
}
