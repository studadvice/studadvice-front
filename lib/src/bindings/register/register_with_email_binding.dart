import 'package:get/get.dart';
import 'package:stud_advice/stud_advice.dart';

class RegisterWithEmailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterWithEmailController>(
      () => RegisterWithEmailController(),
    );
    Get.lazyPut(() => LegalTermsController());
  }
}
