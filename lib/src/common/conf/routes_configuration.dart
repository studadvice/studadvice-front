import 'package:get/get.dart';
import 'package:stud_advice/src/screens/common/forgot_password/forgot_password_screen.dart';
import 'package:stud_advice/src/screens/common/legal_conditions/legal_conditions_screen.dart';
import 'package:stud_advice/src/screens/common/welcome/welcome_screen.dart';
import 'package:stud_advice/src/screens/home/home_page.dart';
import 'package:stud_advice/src/screens/init_time/init_time_screen.dart';
import 'package:stud_advice/src/screens/login/login_screen.dart';
import 'package:stud_advice/src/screens/register/register_options_screen.dart';
import 'package:stud_advice/src/screens/register/register_user_information_screen.dart';
import 'package:stud_advice/src/screens/register/register_with_email_screen.dart';

class RoutesConfiguration {
  static const String initialRoute = WelcomeScreen.navigatorId;

  List<GetPage> configureRoutes() {
    return [
      GetPage(
          name: WelcomeScreen.navigatorId, page: () => const WelcomeScreen()),
      GetPage(name: InitTimeScreen.navigatorId, page: () => InitTimeScreen()),
      GetPage(name: HomePageScreen.navigatorId, page: () => HomePageScreen()),
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
      GetPage(
          name: ForgotPasswordScreen.navigatorId,
          page: () => ForgotPasswordScreen())
    ];
  }
}
