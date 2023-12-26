import 'package:get/get.dart';
import 'package:stud_advice/stud_advice.dart';
import '../../bindings/administrative_process/administrative_process_binding.dart';
import '../../bindings/settings/settings_binding.dart';
import '../../screens/dashboard/dashboard_screen.dart';

class RoutesConfiguration {
  static const String initialRoute = InitTimeScreen.navigatorId;

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
