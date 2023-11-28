import 'package:get/get.dart';
import 'package:stud_advice/src/common/helper/navigation_helper.dart';
import 'package:stud_advice/src/controllers/authentication/authentication_controller.dart';
import 'package:stud_advice/src/screens/welcome/welcome_screen.dart';

class SettingsController extends GetxController {
  final AuthenticationController _authenticationController = Get.find();

  Future<void> logout() async {
    await _authenticationController.logout();
    NavigationHelper.navigateTo(WelcomeScreen.navigatorId);
  }
}
