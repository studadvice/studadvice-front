import 'package:get/get.dart';
import 'package:stud_advice/stud_advice.dart';

class RoadmapBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<StepController>(StepController());
  }
}
