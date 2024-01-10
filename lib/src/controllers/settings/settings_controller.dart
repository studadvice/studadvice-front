import 'package:get/get.dart';
import 'package:stud_advice/src/controllers/common/navbar_controller.dart';
import 'package:stud_advice/stud_advice.dart';

class SettingsController extends GetxController {
  final AuthenticationController _authenticationController = Get.find();
  final NavBarController _navBarController = Get.find();

  Future<void> logout() async {
    await _authenticationController.logout();
    _navBarController.resetTabIndex();
    Get.offAllNamed(InitTimeScreen.navigatorId);
  }
}
