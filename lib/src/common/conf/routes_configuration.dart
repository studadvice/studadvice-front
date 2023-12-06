import 'package:get/get.dart';
import 'package:stud_advice/stud_advice.dart';

class RoutesConfiguration {
  // TODO: update initialRoute to welcome screen
  static const String initialRoute = AdministrativesProcessesScreen.navigatorId;

  List<GetPage> configureRoutes() {
    return [
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
        binding: RegisterOptionsBinding(),
        middlewares: [I18nMiddleware()],
      ),
      GetPage(
        name: RegisterWithEmailScreen.navigatorId,
        page: () => RegisterWithEmailScreen(),
        binding: RegisterWithEmailBinding(),
        middlewares: [I18nMiddleware()],
      ),
      GetPage(
        name: RegisterUserInformationScreen.navigatorId,
        page: () => const RegisterUserInformationScreen(),
        binding: RegisterUserInformationBinding(),
        middlewares: [I18nMiddleware()],
      ),
      GetPage(
        name: LegalTermsScreen.navigatorId,
        page: () => LegalTermsScreen(),
        middlewares: [I18nMiddleware()],
      ),
      GetPage(
        name: SettingsScreen.navigatorId,
        page: () => SettingsScreen(),
        middlewares: [I18nMiddleware()],
        binding: SettingsBinding(),
      ),
      GetPage(
          name: ForgotPasswordScreen.navigatorId,
          page: () => ForgotPasswordScreen(),
          binding: ForgotPasswordBinding(),
          middlewares: [I18nMiddleware()]),
      GetPage(
        name: AdministrativesProcessesScreen.navigatorId,
        page: () => const AdministrativesProcessesScreen(),
        middlewares: [I18nMiddleware()],
      )
    ];
  }
}
