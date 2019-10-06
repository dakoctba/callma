import 'package:callma/blocs/appointments_bloc.dart';
import 'package:callma/blocs/user_bloc.dart';
import 'package:callma/blocs/professionals_bloc.dart';
import 'package:callma/blocs/professions_bloc.dart';
import 'package:callma/blocs/reviews_bloc.dart';
import 'package:callma/blocs/specialties_bloc.dart';
import 'package:callma/blocs/summary_bloc.dart';
import 'package:callma/store/ApplicationStore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:callma/theme/application_style.dart';
import 'package:callma/views/login/login_view.dart';
import 'package:provider/provider.dart';

Future main() async {
  await DotEnv().load('.env');
  runApp(Application());
}

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ApplicationStore>.value(value: ApplicationStore()),
        Provider<AppointmentsBloc>.value(value: AppointmentsBloc()),
        Provider<UserBloc>.value(value: UserBloc()),
        Provider<ProfessionalsBloc>.value(value: ProfessionalsBloc()),
        Provider<ProfessionsBloc>.value(value: ProfessionsBloc()),
        Provider<ReviewsBloc>.value(value: ReviewsBloc()),
        Provider<SpecialtiesBloc>.value(value: SpecialtiesBloc()),
        Provider<SummaryBloc>.value(value: SummaryBloc())
      ],
      child: MaterialApp(
          title: 'Callma',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              inputDecorationTheme: InputDecorationTheme(
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: ApplicationStyle.SECONDARY_GREEN)))),
          home: LoginView()),
    );
  }
}
