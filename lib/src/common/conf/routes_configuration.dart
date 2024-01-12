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
        page: () => WelcomeScreen(),
      ),
      GetPage(
        name: HomePageScreen.navigatorId,
        page: () => HomePageScreen(),
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
        name: DealsSearchScreen.navigatorId,
        page: () => DealsSearchScreen(),
        binding: DealsBinding(),
      ),
      GetPage(
          name: DealDetailScreen.navigatorId,
          page: () => DealDetailScreen(),
          binding: DealsBinding()),
      GetPage(
          name: NavigationBarScreen.navigatorId,
          page: () => NavigationBarScreen()),
      GetPage(
        name: FavoriteAdministrativesProcessesScreen.navigatorId,
        page: () => FavoriteAdministrativesProcessesScreen(),
        binding: FavoriteAdministrativeProcessBinding(),
      ),
      GetPage(
          name: SupportScreen.navigatorId,
          page: () => SupportScreen(),
          binding: SupportBinding()),
      GetPage(name: FaqScreen.navigatorId, page: () => FaqScreen()),
      GetPage(
        name: RoadMapScreen.navigatorId,
        page: () => RoadMapScreen(
          administrativeProcessName: '',
        ),
        binding: StepBinding(),
      ),
      GetPage(
        name: CalendarScreen.navigatorId,
        page: () => CalendarScreen(),
        binding: CalendarBinding(),
      ),
      GetPage(
        name: ChangePasswordScreen.navigatorId,
        page: () => ChangePasswordScreen(),
        binding: ChangePasswordBinding(),
      ),
      GetPage(
        name: ChangeUserDataScreen.navigatorId,
        page: () => const ChangeUserDataScreen(),
        binding: RegisterUserInformationBinding(),
      ),
      GetPage(name: FaqScreen.navigatorId, page: () => FaqScreen()),
      GetPage(
        name: RoadMapScreen.navigatorId,
        page: () => RoadMapScreen(
          administrativeProcessName: '',
        ),
        binding: StepBinding(),
      ),
    ];
  }
}
