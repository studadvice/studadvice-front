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
        // middlewares: [I18nMiddleware()],
      ),
      GetPage(
        name: InitTimeScreen.navigatorId,
        page: () => InitTimeScreen(),
        // middlewares: [I18nMiddleware()],
      ),
      GetPage(
        name: HomePageScreen.navigatorId,
        page: () => HomePageScreen(),
        binding: CategoryBinding(),
        middlewares: [I18nMiddleware()],
      ),
      GetPage(
        name: LoginScreen.navigatorId,
        page: () => LoginScreen(),
        binding: LoginBinding(),
      ),
      GetPage(
        name: RegisterOptionsScreen.navigatorId,
        page: () => RegisterOptionsScreen(),
        binding: RegisterOptionsBinding(),
      ),
      GetPage(
        name: RegisterWithEmailScreen.navigatorId,
        page: () => RegisterWithEmailScreen(),
        binding: RegisterWithEmailBinding(),
      ),
      GetPage(
        name: RegisterUserInformationScreen.navigatorId,
        page: () => const RegisterUserInformationScreen(),
        binding: RegisterUserInformationBinding(),
      ),
      GetPage(
        name: LegalTermsScreen.navigatorId,
        page: () => LegalTermsScreen(),
      ),
      GetPage(
        name: SettingsScreen.navigatorId,
        page: () => SettingsScreen(),
        binding: SettingsBinding(),
      ),
      GetPage(
        name: RoadMapScreen.navigatorId,
        page: () => RoadMapScreen(
          currentStep: 1,
        ),
        middlewares: [I18nMiddleware()],
      ),
      GetPage(
        name: ForgotPasswordScreen.navigatorId,
        page: () => ForgotPasswordScreen(),
        binding: ForgotPasswordBinding(),
      ),
      GetPage(
        name: RoadMapScreen.navigatorId,
        page: () => RoadMapScreen(currentStep: 0,),
        middlewares: [I18nMiddleware()],
      ),
      GetPage(
        name: AdministrativesProcessesScreen.navigatorId,
        page: () => AdministrativesProcessesScreen(),
        binding: AdministrativeProcessBinding(),
        middlewares: [I18nMiddleware()],
      )
    ];
  }
}
