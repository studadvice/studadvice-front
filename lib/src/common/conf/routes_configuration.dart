import 'package:get/get.dart';
import 'package:stud_advice/src/bindings/deals/deals_binding.dart';
import 'package:stud_advice/src/bindings/roadmap/roadmap_binding.dart';
import 'package:stud_advice/src/bindings/settings/change_password_binding.dart';
import 'package:stud_advice/src/bindings/settings/support_binding.dart';
import 'package:stud_advice/src/controllers/categories/calendar_controller.dart';
import 'package:stud_advice/src/screens/home/calendar.dart';
import 'package:stud_advice/src/screens/faq/faq_screen.dart';
import 'package:stud_advice/src/screens/roadmap/roadmap_screen.dart';
import 'package:stud_advice/src/screens/settings/change_password_screen.dart';
import 'package:stud_advice/src/screens/settings/change_user_data_screen.dart';
import 'package:stud_advice/src/screens/settings/support_screen.dart';
import 'package:stud_advice/stud_advice.dart';

import '../../bindings/category/calendar_binding.dart';

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
      ),
      GetPage(
          name: NavigationBarScreen.navigatorId,
          page: () => NavigationBarScreen()
      ),
      GetPage(
        name: FavoriteAdministrativesProcessesScreen.navigatorId,
        page: () => FavoriteAdministrativesProcessesScreen(),
        binding: FavoriteAdministrativeProcessBinding(),
      ),
      GetPage(
          name: SupportScreen.navigatorId,
          page: () => SupportScreen(),
          binding: SupportBinding()
      ),
      GetPage(
          name: FaqScreen.navigatorId,
          page: () => FaqScreen()
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
      GetPage(
        name: RoadMapScreen.navigatorId,
        page: () => RoadMapScreen(),
        binding: RoadmapBinding(),
      ),
    ];
  }
}