import 'package:get/get.dart';
import 'package:stud_advice/src/controllers/controllers.dart';

class SettingsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsController>(
          () => SettingsController(),
    );
  }
}
