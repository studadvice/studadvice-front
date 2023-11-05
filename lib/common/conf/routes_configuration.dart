import 'package:flutter/widgets.dart';
import 'package:stud_advice/features/user/use_cases/legal_conditions/screens/legal_conditions_screen.dart';
import 'package:stud_advice/features/user/use_cases/register/screens/register_with_email_screen.dart';

import '../../features/user/use_cases/init_time/screens/init_time_screen.dart';
import '../../features/user/use_cases/login/screens/login_screen.dart';
import '../../features/user/use_cases/register/screens/register_options_screen.dart';

class RoutesConfiguration {
  static const String initialRoute = InitTimeScreen.navigatorId;

  // Configure the routes for the application.
  Map<String, Widget Function(dynamic context)> configureRoutes() {
    return {
      InitTimeScreen.navigatorId: (context) => const InitTimeScreen(),
      LoginScreen.navigatorId: (context) => const LoginScreen(),
      RegisterOptionsScreen.navigatorId: (context) =>
          const RegisterOptionsScreen(),
      RegisterWithEmailScreen.navigatorId: (context) =>
          const RegisterWithEmailScreen(),
      LegalTermsScreen.navigatorId: (context) => LegalTermsScreen(),
    };
  }
}
