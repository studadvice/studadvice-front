import 'package:get/get.dart';
import 'package:stud_advice/stud_advice.dart';
    

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<SocialSignInController>(() => SocialSignInController());
    Get.lazyPut<LegalTermsController>(() => LegalTermsController());
  }
}
