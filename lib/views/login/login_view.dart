import 'package:callma/helpers/application_helper.dart';
import 'package:callma/services/login_service.dart';
import 'package:callma/theme/application_style.dart';
import 'package:callma/library/custom_app_bar.dart';
import 'package:callma/library/custom_button.dart';
import 'package:callma/views/scheduling/professions/professions_view.dart';
import 'package:callma/views/login/onboarding_view.dart';
import 'package:flutter/material.dart';

import 'package:callma/exceptions/callma_exception.dart';

class LoginView extends StatelessWidget with ApplicationHelper {
  final _formKey = GlobalKey<FormState>();

  static _launchDialogError(BuildContext context, String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Callma"),
            content: Text(message),
            actions: <Widget>[
              FlatButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(13),
          children: <Widget>[
            Padding(
                padding: EdgeInsets.symmetric(vertical: 40),
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                )),
            TextFormField(
              decoration: InputDecoration(hintText: "E-mail", border: OutlineInputBorder()),
              keyboardType: TextInputType.emailAddress,
              initialValue: "jackson@setbox.com.br",
              validator: (email) {
                if (!ApplicationHelper.isEmailValid(email)) {
                  return "E-mail inválido";
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(hintText: "Senha", border: OutlineInputBorder()),
              obscureText: true,
            ),
            SizedBox(height: 10),
            GestureDetector(
              child: Text("Esqueceu sua senha?", style: TextStyle(color: ApplicationStyle.SECONDARY_GREEN)),
              onTap: () {
                debugPrint("Esqueci minha senha...");
              },
            ),
            CustomButton(
                label: "Entrar",
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    try {
                      await LoginService.login();
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfessionsView()));
                    } on CallmaException catch (e) {
                      _launchDialogError(context, e.cause);
                    }
                  }
                }),
            GestureDetector(
                child: Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                  Text("Não possui uma conta? ",
                      style: TextStyle(fontSize: 12, color: ApplicationStyle.SECONDARY_GREEN)),
                  Text("Cadastre-se",
                      style:
                          TextStyle(fontSize: 12, color: ApplicationStyle.SECONDARY_GREEN, fontWeight: FontWeight.bold))
                ]),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => OnboardingView()));
                }),
            SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
