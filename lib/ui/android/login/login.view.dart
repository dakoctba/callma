import 'package:callma/blocs/appointment.bloc.dart';
import 'package:callma/blocs/menu.bloc.dart';
import 'package:callma/blocs/user.bloc.dart';
import 'package:callma/enumerations/user_type.dart';
import 'package:callma/helpers/users_helper.dart';
import 'package:callma/models/user.dart';
import 'package:callma/themes/callma.theme.dart';
import 'package:callma/ui/android/help/webview.view.dart';
import 'package:callma/ui/android/login/onboarding.view.dart';
import 'package:callma/ui/android/professional/home/home.view.dart';
import 'package:callma/ui/android/scheduling/professions/professions.view.dart';
import 'package:callma/ui/shared/custom_button.dart';
import 'package:callma/ui/shared/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with UsersHelper {
  AppointmentBloc appointmentBloc;
  UserBloc userBloc;

  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    appointmentBloc = BlocProvider.getBloc<AppointmentBloc>();
    userBloc = BlocProvider.getBloc<UserBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Material(child: CustomLoading("Por favor, aguarde..."))
        : Material(
            child: Form(
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
                    decoration: InputDecoration(
                        hintText: "E-mail", border: OutlineInputBorder()),
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
                    decoration: InputDecoration(
                        hintText: "Senha", border: OutlineInputBorder()),
                    controller: passwordController,
                    obscureText: true,
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    child: Text("Esqueceu sua senha?",
                        style: TextStyle(color: SECONDARY_GREEN)),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WebviewView(
                                  "${DotEnv().env['API_URL']}/password/new")));
                    },
                  ),
                  CustomButton("Entrar", () async {
                    if (_formKey.currentState.validate()) {
                      _login(context);
                    }
                  }),
                  GestureDetector(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Não possui uma conta? ",
                                style: TextStyle(
                                    fontSize: 12, color: SECONDARY_GREEN)),
                            Text("Cadastre-se",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: SECONDARY_GREEN,
                                    fontWeight: FontWeight.bold))
                          ]),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OnboardingView()));
                      }),
                  SizedBox(height: 20)
                ],
              ),
            ),
          );
  }

  void _login(BuildContext context) async {
    try {
      setState(() {
        isLoading = true;
      });

      User user =
          await userBloc.login(loginController.text, passwordController.text);
      appointmentBloc.setProfileId(user.profiles[0].id);

      BlocProvider.getBloc<MenuBloc>().setOption(0);

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => user.userType == UserType.professional
                  ? HomeView()
                  : ProfessionsView()));
    } catch (e) {
      setState(() {
        isLoading = false;
      });

      String message;
      try {
        message = e.message;
      } catch (ex) {
        Logger().e(ex);
        message = "Erro não tratato";
      }

      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Ops"),
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
  }
}
