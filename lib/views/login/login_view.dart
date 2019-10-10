import 'package:callma/controllers/appointments_controller.dart';
import 'package:callma/controllers/users_controller.dart';
import 'package:callma/exceptions/callma_exception.dart';
import 'package:callma/helpers/users_helper.dart';
import 'package:callma/library/custom_app_bar.dart';
import 'package:callma/library/custom_button.dart';
import 'package:callma/models/user.dart';
import 'package:callma/theme/application_style.dart';
import 'package:callma/views/help/webview_view.dart';
import 'package:callma/views/login/onboarding_view.dart';
import 'package:callma/views/scheduling/professions/professions_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with UsersHelper {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  Widget _buildLoadingWidget() {
    return Material(
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("Por favor, aguarde..."), SizedBox(height: 10), CircularProgressIndicator()],
      )),
    );
  }

  _login(BuildContext context) async {
    var usersController = Provider.of<UsersController>(context);
    final appointmentsController = Provider.of<AppointmentsController>(context);

    try {
      setState(() {
        isLoading = true;
      });

      User user = await usersController.login(loginController.text, passwordController.text);
      appointmentsController.setUser(user);

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfessionsView()));
    } on CallmaException catch (e) {
      setState(() {
        isLoading = false;
      });

      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Callma"),
              content: Text(e.cause),
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
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? _buildLoadingWidget()
        : Scaffold(
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
                    controller: loginController,
                    validator: (email) {
                      if (!isEmailValid(email)) {
                        return "E-mail inválido";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(hintText: "Senha", border: OutlineInputBorder()),
                    controller: passwordController,
                    obscureText: true,
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    child: Text("Esqueceu sua senha?", style: TextStyle(color: ApplicationStyle.SECONDARY_GREEN)),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              WebviewView("Esqueci minha senha", "${DotEnv().env['API_URL']}/password/new")));
                    },
                  ),
                  CustomButton(
                      label: "Entrar",
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          _login(context);
                        }
                      }),
                  GestureDetector(
                      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                        Text("Não possui uma conta? ",
                            style: TextStyle(fontSize: 12, color: ApplicationStyle.SECONDARY_GREEN)),
                        Text("Cadastre-se",
                            style: TextStyle(
                                fontSize: 12, color: ApplicationStyle.SECONDARY_GREEN, fontWeight: FontWeight.bold))
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
