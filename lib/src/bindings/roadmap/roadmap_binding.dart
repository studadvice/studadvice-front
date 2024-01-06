import 'package:get/get.dart';

import '../../controllers/roadmap/step_controller.dart';

class RoadmapBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<StepController>(StepController());
  }
}
