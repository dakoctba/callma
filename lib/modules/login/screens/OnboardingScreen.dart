import 'package:callma/components/CallmaColors.dart';
import 'package:callma/components/bars/CallmaAppBar.dart';
import 'package:callma/components/buttons/CallmaButton.dart';
import 'package:callma/util/validations/FormValidators.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

//  FirebaseAuth auth = FirebaseAuth.instance;
//  FirebaseUser user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CallmaAppBar(title: "Cadastre-se"),
        body: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.all(13),
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(hintText: "Nome"),
                        validator: (email) {
                          if (!FormValidators.isEmailValid(email)) {
                            return "E-mail inválido";
                          }
                          return "OK";
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(hintText: "CPF")
                      ),
                      SizedBox(height: 10),
                      GestureDetector(
                        child: Text("Esqueceu sua senha?", style: TextStyle(color: CallmaColors.VERDE_ESCURO)),
                        onTap: () {
                          debugPrint("Esqueci minha senha...");
                        },
                      ),
                    ],
                  ),
                ),
                Column(
                  children: <Widget>[
                    CallmaButton("Cadastrar", () {
                      if (_formKey.currentState.validate()) {
                        debugPrint("Entrando...");
                      }
                    }),
                  ],
                )
              ],
            )));
  }
}
