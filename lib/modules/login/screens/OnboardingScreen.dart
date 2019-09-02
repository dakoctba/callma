import 'package:callma/components/bars/CallmaAppBar.dart';
import 'package:flutter/material.dart';

import '../../../components/buttons/CallmaButton.dart';
import '../../../util/validations/FormValidators.dart';
import '../../consulta/screens/ProfessionsScreen.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _formKey = GlobalKey<FormState>();

//  FirebaseAuth auth = FirebaseAuth.instance;
//  FirebaseUser user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CallmaAppBar(title: "Cadastre-se"),
        body: Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.all(13),
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 40),
                    child: Text(
                      "Cadastre-se",
                      style: TextStyle(fontSize: 24),
                      textAlign: TextAlign.center,
                    )
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "Nome completo", border: OutlineInputBorder()),
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(hintText: "Telefone", border: OutlineInputBorder()),
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(hintText: "E-mail", border: OutlineInputBorder()),
                  keyboardType: TextInputType.emailAddress,
                  validator: (email) {
                    if (!FormValidators.isEmailValid(email)) {
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
                CallmaButton("Criar conta", () {
                  if (_formKey.currentState.validate()) {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfessionsScreen()));
                  }
                })
              ],
            )
        )
    );
  }
}
