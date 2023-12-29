import 'package:get/get.dart';
import 'package:stud_advice/src/controllers/controllers.dart';
import 'package:stud_advice/src/controllers/support/support_controller.dart';

class SupportBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SupportController>(SupportController());
  }
}
