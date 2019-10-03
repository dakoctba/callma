import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:callma/theme/application_style.dart';
import 'package:callma/views/login/login_view.dart';

Future main() async {
  await DotEnv().load('.env');
  runApp(Application());
}

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Callma',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            inputDecorationTheme: InputDecorationTheme(
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: ApplicationStyle.SECONDARY_GREEN)))),
        home: LoginView());
  }
}
