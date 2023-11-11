import 'package:flutter/widgets.dart';
import 'package:stud_advice/src/screens/home/home_page.dart';
import 'package:stud_advice/src/screens/init_time/init_time_screen.dart';
import 'package:stud_advice/src/screens/legal_conditions/legal_conditions_screen.dart';
import 'package:stud_advice/src/screens/login/login_screen.dart';
import 'package:stud_advice/src/screens/register/register_options_screen.dart';
import 'package:stud_advice/src/screens/register/register_user_information_screen.dart';
import 'package:stud_advice/src/screens/register/register_with_email_screen.dart';

class RoutesConfiguration {
  static const String initialRoute = InitTimeScreen.navigatorId;

  // Configure the routes for the application.
  Map<String, Widget Function(dynamic context)> configureRoutes() {
    return {
      InitTimeScreen.navigatorId: (context) => const InitTimeScreen(),
      HomePageScreen.navigatorId: (context) => const HomePageScreen(),
      LoginScreen.navigatorId: (context) => const LoginScreen(),
      RegisterOptionsScreen.navigatorId: (context) =>
          const RegisterOptionsScreen(),
      RegisterWithEmailScreen.navigatorId: (context) =>
          const RegisterWithEmailScreen(),
      LegalTermsScreen.navigatorId: (context) => LegalTermsScreen(),
      RegisterUserInformationScreen.navigatorId: (context) =>
          const RegisterUserInformationScreen(),
    };
  }
}
