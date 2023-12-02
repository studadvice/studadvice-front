import 'package:get/get.dart';
import 'package:stud_advice/src/bindigs/bindings.dart';
import 'package:stud_advice/src/middleware/middlewares.dart';
import 'package:stud_advice/src/screens/screens.dart';


class RoutesConfiguration {
  static const String initialRoute = InitTimeScreen.navigatorId;
  List<GetPage> configureRoutes() {
    return [
      GetPage(
        name: InitTimeScreen.navigatorId,
        page: () => InitTimeScreen(),
        middlewares: [I18nMiddleware()],
      ),
      GetPage(
        name: WelcomeScreen.navigatorId,
        page: () => const WelcomeScreen(),
        middlewares: [I18nMiddleware()],
      ),
      GetPage(
        name: HomePageScreen.navigatorId,
        page: () => HomePageScreen(),
        middlewares: [I18nMiddleware()],
      ),
      GetPage(
        name: LoginScreen.navigatorId,
        page: () => LoginScreen(),
        middlewares: [I18nMiddleware()],
        binding: LoginBinding(),
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
      GetPage(
        name: SettingsScreen.navigatorId,
        page: () => SettingsScreen(),
        middlewares: [I18nMiddleware()],
        binding: SettingsBinding(),
      ),
    ];
  }
}
