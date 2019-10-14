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
import 'package:callma/ui/android/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await Initializer.initialize();
  runApp(Application());
}

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AddressBloc>.value(value: AddressBloc()),
        ChangeNotifierProvider<AppointmentBloc>.value(value: AppointmentBloc()),
        ChangeNotifierProvider<MenuBloc>.value(value: MenuBloc()),
        ChangeNotifierProvider<ProfessionalBloc>.value(
            value: ProfessionalBloc()),
        ChangeNotifierProvider<ProfessionBloc>.value(value: ProfessionBloc()),
        ChangeNotifierProvider<ReviewBloc>.value(value: ReviewBloc()),
        ChangeNotifierProvider<SpecialtyBloc>.value(value: SpecialtyBloc()),
        ChangeNotifierProvider<SummaryBloc>.value(value: SummaryBloc()),
        ChangeNotifierProvider<UserBloc>.value(value: UserBloc()),
      ],
      child: new Main(),
    );
  }
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Callma',
        debugShowCheckedModeBanner: DotEnv().env['ENVIRONMENT'] != "production",
        theme: defaultTheme(),
        home: LoginView());
  }
}
