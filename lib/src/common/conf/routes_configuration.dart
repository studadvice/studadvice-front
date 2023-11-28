import 'package:get/get.dart';
import 'package:stud_advice/src/middleware/common/i18n_middleware.dart';
import 'package:stud_advice/src/screens/home/home_page.dart';
import 'package:stud_advice/src/screens/init_time/init_time_screen.dart';
import 'package:stud_advice/src/screens/legal_terms/legal_terms_screen.dart';
import 'package:stud_advice/src/screens/login/login_screen.dart';
import 'package:stud_advice/src/screens/register/register_options_screen.dart';
import 'package:stud_advice/src/screens/register/register_user_information_screen.dart';
import 'package:stud_advice/src/screens/register/register_with_email_screen.dart';
import 'package:stud_advice/src/screens/settings/settings_screen.dart';
import 'package:stud_advice/src/screens/welcome/welcome_screen.dart';

class RoutesConfiguration {
  List<GetPage> configureRoutes() {
    return [
      GetPage(
        name: SettingsScreen.navigatorId,
        page: () => const SettingsScreen(),
        middlewares: [I18nMiddleware()],
      ),
      GetPage(
        name: WelcomeScreen.navigatorId,
        page: () => const WelcomeScreen(),
        middlewares: [I18nMiddleware()],
      ),
      GetPage(
        name: InitTimeScreen.navigatorId,
        page: () => InitTimeScreen(),
        middlewares: [I18nMiddleware()],
      ),
      GetPage(
        name: HomePageScreen.navigatorId,
        page: () => const HomePageScreen(),
        middlewares: [I18nMiddleware()],
      ),
      GetPage(
        name: LoginScreen.navigatorId,
        page: () => LoginScreen(),
        middlewares: [I18nMiddleware()],
      ),
      GetPage(
        name: RegisterOptionsScreen.navigatorId,
        page: () => RegisterOptionsScreen(),
        middlewares: [I18nMiddleware()],
      ),
      GetPage(
        name: RegisterWithEmailScreen.navigatorId,
        page: () => RegisterWithEmailScreen(),
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
