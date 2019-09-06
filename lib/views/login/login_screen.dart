import 'package:callma/helpers/application_helper.dart';
import 'package:callma/theme/application_style.dart';
import 'package:callma/components/bars/callma_app_bar.dart';
import 'package:callma/components/buttons/callma_button.dart';
import 'package:callma/views/consulta/professions_screen.dart';
import 'package:callma/views/login/onboarding_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget with ApplicationHelper {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CallmaAppBar(),
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
            CallmaButton("Entrar", () {
              if (_formKey.currentState.validate()) {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfessionsScreen()));
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
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => OnboardingScreen()));
                }),
            SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
