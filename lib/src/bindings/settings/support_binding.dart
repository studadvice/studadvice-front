import 'package:get/get.dart';
import 'package:stud_advice/src/controllers/settings/support_controller.dart';

class SupportBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SupportController>(SupportController());
  }
}
