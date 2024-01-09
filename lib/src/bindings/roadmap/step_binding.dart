import 'package:get/get.dart';
import 'package:stud_advice/stud_advice.dart';
class StepBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<StepController>(StepController());
    Get.put<RoadMapController>(RoadMapController());
    Get.put<InformationModalController>(InformationModalController());
  }
}