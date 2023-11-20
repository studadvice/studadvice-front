import 'package:get/get.dart';
import 'package:stud_advice/src/common/middlewares/i18n_middleware.dart';
import 'package:stud_advice/src/screens/home/home_page.dart';
import 'package:stud_advice/src/screens/init_time/init_time_screen.dart';
import 'package:stud_advice/src/screens/legal_terms/legal_terms_screen.dart';
import 'package:stud_advice/src/screens/login/login_screen.dart';
import 'package:stud_advice/src/screens/register/register_options_screen.dart';
import 'package:stud_advice/src/screens/register/register_user_information_screen.dart';
import 'package:stud_advice/src/screens/register/register_with_email_screen.dart';
import 'package:stud_advice/src/screens/settings/settings_screen.dart';

class RoutesConfiguration {
  static const String initialRoute = InitTimeScreen.navigatorId;
  // static const String initialRoute = SettingsScreen.navigatorId;

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
        name: InitTimeScreen.navigatorId,
        page: () => const InitTimeScreen(),
        middlewares: [I18nMiddleware()],
      ),
      GetPage(
        name: HomePageScreen.navigatorId,
        page: () => const HomePageScreen(),
        middlewares: [I18nMiddleware()],
      ),
      GetPage(
        name: LoginScreen.navigatorId,
        page: () => const LoginScreen(),
        middlewares: [I18nMiddleware()],
      ),
      GetPage(
        name: RegisterOptionsScreen.navigatorId,
        page: () => const RegisterOptionsScreen(),
        middlewares: [I18nMiddleware()],
      ),
      GetPage(
        name: RegisterWithEmailScreen.navigatorId,
        page: () => const RegisterWithEmailScreen(),
        middlewares: [I18nMiddleware()],
      ),
      GetPage(
        name: LegalTermsScreen.navigatorId,
        page: () => const LegalTermsScreen(),
        middlewares: [I18nMiddleware()],
      ),
      GetPage(
        name: RegisterUserInformationScreen.navigatorId,
        page: () => const RegisterUserInformationScreen(),
        middlewares: [I18nMiddleware()],
      ),
    ];
  }
}
