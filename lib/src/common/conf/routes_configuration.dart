import 'package:get/get.dart';
import 'package:stud_advice/stud_advice.dart';

class RoutesConfiguration {
  static const String initialRoute = WelcomeScreen.navigatorId;

  List<GetPage> configureRoutes() {
    return [
      GetPage(
        name: InitTimeScreen.navigatorId,
        page: () => InitTimeScreen(),
      ),
      GetPage(
        name: WelcomeScreen.navigatorId,
        page: () => const WelcomeScreen(),
      ),
      GetPage(
        name: HomePageScreen.navigatorId,
        page: () => HomePageScreen(),
        binding: CategoryBinding(),
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
        name: ForgotPasswordScreen.navigatorId,
        page: () => ForgotPasswordScreen(),
        binding: ForgotPasswordBinding(),
      ),
      GetPage(
        name: AdministrativesProcessesScreen.navigatorId,
        page: () => AdministrativesProcessesScreen(),
        binding: AdministrativeProcessBinding(),
      ),
      GetPage(
        name: DashboardScreen.navigatorId,
        page: () => DashboardScreen(),
      )
    ];
  }
}
