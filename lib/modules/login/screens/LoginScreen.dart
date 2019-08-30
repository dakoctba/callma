import 'package:callma/components/CallmaColors.dart';
import 'package:callma/components/bars/CallmaAppBar.dart';
import 'package:callma/components/buttons/CallmaButton.dart';
import 'package:callma/util/validations/FormValidators.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CallmaAppBar("Login"),
        body: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.all(13),
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(hintText: "E-mail"),
                        keyboardType: TextInputType.emailAddress,
                        validator: (email) {
                          if (!FormValidators.isEmailValid(email)) {
                            return "E-mail inválido";
                          }
                          return "OK";
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(hintText: "Senha"),
                        obscureText: true,
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
                    CallmaButton("Entrar", () {
                      if (_formKey.currentState.validate()) {
                        debugPrint("Entrando...");
                      }
                    }),
                    Align(
                        alignment: Alignment.center,
                        child: Text("Não possui uma conta?", style: TextStyle(color: CallmaColors.VERDE_ESCURO))),
                    Align(
                        alignment: Alignment.center,
                        child: GestureDetector(
                            child: Text("Cadastre-se",
                                style: TextStyle(color: CallmaColors.VERDE_ESCURO, fontWeight: FontWeight.bold)),
                            onTap: () {
                              debugPrint("Cadastre-se...");
                            }))
                  ],
                )
              ],
            )));
  }
}
