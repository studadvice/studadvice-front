import 'package:get/get.dart';
import 'package:stud_advice/src/controllers/authentication/social_sign_in_controller.dart';
import 'package:stud_advice/src/controllers/legal_terms/legal_terms_controller.dart';
import 'package:stud_advice/src/controllers/login/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController());
    Get.put<SocialSignInController>(SocialSignInController());
    Get.put<LegalTermsController>(LegalTermsController());
  }
}
