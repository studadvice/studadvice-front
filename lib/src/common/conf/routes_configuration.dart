import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:stud_advice/src/common/middlewares/translations_middleware.dart';
import 'package:stud_advice/src/screens/home/home_page.dart';
import 'package:stud_advice/src/screens/init_time/init_time_screen.dart';
import 'package:stud_advice/src/screens/legal_conditions/legal_conditions_screen.dart';
import 'package:stud_advice/src/screens/login/login_screen.dart';
import 'package:stud_advice/src/screens/register/register_options_screen.dart';
import 'package:stud_advice/src/screens/register/register_user_information_screen.dart';
import 'package:stud_advice/src/screens/register/register_with_email_screen.dart';
import 'package:stud_advice/src/screens/settings/settings_screen.dart';

class RoutesConfiguration {
  // static const String initialRoute = InitTimeScreen.navigatorId;
  static const String initialRoute = SettingsScreen.navigatorId;

  List<GetPage> configureRoutes() {
    return [
      GetPage(
          name: WelcomeScreen.navigatorId, page: () => const WelcomeScreen()),
      GetPage(name: InitTimeScreen.navigatorId, page: () => InitTimeScreen()),
      GetPage(
          name: HomePageScreen.navigatorId, page: () => const HomePageScreen()),
      GetPage(name: LoginScreen.navigatorId, page: () => LoginScreen()),
      GetPage(
          name: RegisterOptionsScreen.navigatorId,
          page: () => RegisterOptionsScreen()),
      GetPage(
          name: RegisterWithEmailScreen.navigatorId,
          page: () => RegisterWithEmailScreen()),
      GetPage(
          name: LegalTermsScreen.navigatorId, page: () => LegalTermsScreen()),
      GetPage(
          name: RegisterUserInformationScreen.navigatorId,
          page: () => const RegisterUserInformationScreen()),
    ];
  }

  List<GetPage> configureRoutesGet() {
    return [
      GetPage(
        name: SettingsScreen.navigatorId.startsWith('/') ? SettingsScreen.navigatorId : '/${SettingsScreen.navigatorId}',
        page: () => SettingsScreen(),
        middlewares: [TranslationsMiddleware()],
      ),
      GetPage(
        name: InitTimeScreen.navigatorId.startsWith('/') ? InitTimeScreen.navigatorId : '/${InitTimeScreen.navigatorId}',
        page: () => const InitTimeScreen(),
        middlewares: [TranslationsMiddleware()],
      ),
      GetPage(
        name: HomePageScreen.navigatorId.startsWith('/') ? HomePageScreen.navigatorId : '/${HomePageScreen.navigatorId}',
        page: () => const HomePageScreen(),
        middlewares: [TranslationsMiddleware()],
      ),
      GetPage(
        name: LoginScreen.navigatorId.startsWith('/') ? LoginScreen.navigatorId : '/${LoginScreen.navigatorId}',
        page: () => const LoginScreen(),
        middlewares: [TranslationsMiddleware()],
      ),
      GetPage(
        name: RegisterOptionsScreen.navigatorId.startsWith('/') ? RegisterOptionsScreen.navigatorId : '/${RegisterOptionsScreen.navigatorId}',
        page: () => const RegisterOptionsScreen(),
        middlewares: [TranslationsMiddleware()],
      ),
      GetPage(
        name: RegisterWithEmailScreen.navigatorId.startsWith('/') ? RegisterWithEmailScreen.navigatorId : '/${RegisterWithEmailScreen.navigatorId}',
        page: () => const RegisterWithEmailScreen(),
        middlewares: [TranslationsMiddleware()],
      ),
      GetPage(
        name: LegalTermsScreen.navigatorId.startsWith('/') ? LegalTermsScreen.navigatorId : '/${LegalTermsScreen.navigatorId}',
        page: () => LegalTermsScreen(),
        middlewares: [TranslationsMiddleware()],
      ),
      GetPage(
        name: RegisterUserInformationScreen.navigatorId.startsWith('/') ? RegisterUserInformationScreen.navigatorId : '/${RegisterUserInformationScreen.navigatorId}',
        page: () => const RegisterUserInformationScreen(),
        middlewares: [TranslationsMiddleware()],
      ),
    ];
  }
}
