import 'package:get/get.dart';
import 'package:stud_advice/src/controllers/controllers.dart';


class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController());
    Get.put<SocialSignInController>(SocialSignInController());
    Get.put<LegalTermsController>(LegalTermsController());
  }
}
