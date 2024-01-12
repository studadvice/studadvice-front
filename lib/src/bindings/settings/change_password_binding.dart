import 'package:get/get.dart';
import 'package:stud_advice/stud_advice.dart';

class ChangePasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ChangePasswordController>(ChangePasswordController());
  }
}
