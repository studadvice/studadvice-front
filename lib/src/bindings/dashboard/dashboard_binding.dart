import 'package:get/get.dart';
import 'package:stud_advice/src/controllers/common/dashboard_controller.dart';

class DashboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<DashboardController>(DashboardController());
  }
}
