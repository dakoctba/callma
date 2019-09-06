import 'package:flutter/material.dart';

import 'package:callma/theme/application_style.dart';
import 'views/login/login_screen.dart';

void main() => runApp(CallmaApp());

class CallmaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Callma',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            inputDecorationTheme: InputDecorationTheme(
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: ApplicationStyle.SECONDARY_GREEN)))),
        home: LoginScreen());
  }
}
