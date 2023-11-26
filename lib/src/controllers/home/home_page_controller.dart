import 'package:get/get.dart';
import 'package:stud_advice/src/controller/authentication/authentication_controller.dart';
import 'package:stud_advice/src/screens/common/welcome/welcome_screen.dart';

class HomePageController extends GetxController {
  final AuthenticationController _authenticationController =
      Get.put(AuthenticationController());

  void signOut() async {
    await _authenticationController.signOut();
    Get.to(() => const WelcomeScreen());
  }
}
