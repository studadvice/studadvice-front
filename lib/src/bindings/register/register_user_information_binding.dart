import 'package:get/get.dart';
import 'package:stud_advice/stud_advice.dart';

class RegisterUserInformationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterUserInformationController>(
      () => RegisterUserInformationController(),
    );
  }
}
