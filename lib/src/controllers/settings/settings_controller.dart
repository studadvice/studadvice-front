import 'package:get/get.dart';
import 'package:stud_advice/stud_advice.dart';

class SettingsController extends GetxController {
  final AuthenticationController _authenticationController = Get.find();

  Future<void> logout() async {
    await _authenticationController.logout();
    Get.toNamed(WelcomeScreen.navigatorId);
  }
}
