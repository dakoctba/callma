import 'package:callma/library/custom_app_bar.dart';
import 'package:callma/library/custom_button.dart';
import 'package:callma/library/status_view.dart';
import 'package:callma/helpers/application_helper.dart';
import 'package:callma/views/consulta/professions/professions_view.dart';
import 'package:flutter/material.dart';

class OnboardingView extends StatefulWidget with ApplicationHelper {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingView> {
  final _formKey = GlobalKey<FormState>();
  bool isChecked = false;

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
                      "Cadastre-se",
                      style: TextStyle(fontSize: 24),
                      textAlign: TextAlign.center,
                    )),
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
                new CheckboxListTile(
                    value: isChecked,
                    onChanged: (bool value) {
                      setState(() {
                        isChecked = value;
                      });
                    },
                    title: new Text('Aceito os Termo de Uso')),
                CustomButton("Criar conta", () {
                  if (_formKey.currentState.validate()) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StatusView("Cadastro efetuado com sucesso", true, "Continuar", () {
                                  Navigator.of(context)
                                      .pushReplacement(MaterialPageRoute(builder: (context) => ProfessionsView()));
                                })));
                  }
                })
              ],
            )));
  }
}
