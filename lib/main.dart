import 'package:callma/config/initializers/application_initializer.dart';
import 'package:callma/controllers/appointments_controller.dart';
import 'package:callma/controllers/menu_controller.dart';
import 'package:callma/controllers/professionals_controller.dart';
import 'package:callma/controllers/professions_controller.dart';
import 'package:callma/controllers/reviews_controller.dart';
import 'package:callma/controllers/specialties_controller.dart';
import 'package:callma/controllers/summaries_controller.dart';
import 'package:callma/controllers/users_controller.dart';
import 'package:callma/theme/application_style.dart';
import 'package:callma/views/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await ApplicationInitializer.initialize();
  runApp(Application());
}

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AppointmentsController>.value(value: AppointmentsController()),
        Provider<MenuController>.value(value: MenuController()),
        Provider<ProfessionalsController>.value(value: ProfessionalsController()),
        Provider<ProfessionsController>.value(value: ProfessionsController()),
        Provider<ReviewsController>.value(value: ReviewsController()),
        Provider<SpecialtiesController>.value(value: SpecialtiesController()),
        Provider<SummariesController>.value(value: SummariesController()),
        Provider<UsersController>.value(value: UsersController()),
      ],
      child: MaterialApp(
          title: 'Callma',
          debugShowCheckedModeBanner: DotEnv().env['ENVIRONMENT'] != "production",
          theme: ThemeData(
              inputDecorationTheme: InputDecorationTheme(
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: ApplicationStyle.SECONDARY_GREEN)))),
          home: LoginView()),
    );
  }
}
