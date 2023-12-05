import 'package:get/get.dart';
import 'package:stud_advice/stud_advice.dart';

class ForgotPasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ForgotPasswordController>(ForgotPasswordController());
  }
}
