import 'package:get/get.dart';
import 'package:stud_advice/src/controllers/controllers.dart';

class RegisterOptionsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SocialSignInController());
    Get.lazyPut(() => LegalTermsController());
  }
}
