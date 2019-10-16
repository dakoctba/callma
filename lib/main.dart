import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:callma/blocs/address.bloc.dart';
import 'package:callma/blocs/appointment.bloc.dart';
import 'package:callma/blocs/menu.bloc.dart';
import 'package:callma/blocs/profession.bloc.dart';
import 'package:callma/blocs/professional.bloc.dart';
import 'package:callma/blocs/review.bloc.dart';
import 'package:callma/blocs/specialty.bloc.dart';
import 'package:callma/blocs/summary.bloc.dart';
import 'package:callma/blocs/user.bloc.dart';
import 'package:callma/initializer.dart';
import 'package:callma/themes/callma.theme.dart';
import 'package:callma/ui/android/login/login.view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await Initializer.initialize();
  runApp(Application());
}

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [
        Bloc((i) => AddressBloc()),
        Bloc((i) => AppointmentBloc()),
        Bloc((i) => MenuBloc()),
        Bloc((i) => ProfessionalBloc()),
        Bloc((i) => ProfessionBloc()),
        Bloc((i) => ReviewBloc()),
        Bloc((i) => SpecialtyBloc()),
        Bloc((i) => SummaryBloc()),
        Bloc((i) => UserBloc()),
      ],
      child: new Main(),
    );
  }
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Callma',
        debugShowCheckedModeBanner: DotEnv().env['ENVIRONMENT'] != "production",
        theme: defaultTheme(),
        home: LoginView());
  }
}
