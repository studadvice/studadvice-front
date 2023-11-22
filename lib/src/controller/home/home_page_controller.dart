import 'package:get/get.dart';
import 'package:stud_advice/src/controller/authentication/authentication_controller.dart';

class HomePageController extends GetxController {
  final AuthenticationController _authenticationController =
      Get.put(AuthenticationController());

  void signOut() async {
    await _authenticationController.signOut();
    Get.back();
  }
}
