import 'package:flutter/widgets.dart';

import '../../features/user/use_cases/init_time/init_time_screen.dart';
import '../../features/user/use_cases/login/login_screen.dart';
import '../../features/user/use_cases/register/register_screen.dart';

class RoutesConfiguration {
  static const String initialRoute = InitTimeScreen.navigatorId;
  // Configure the routes for the application.
  Map<String, Widget Function(dynamic context)> configureRoutes() {
    return {
      InitTimeScreen.navigatorId: (context) => const InitTimeScreen(),
      LoginScreen.navigatorId: (context) => const LoginScreen(),
      RegisterScreen.navigatorId: (context) => const RegisterScreen(),
    };
  }
}
