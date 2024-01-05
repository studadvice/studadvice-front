import 'package:get/get.dart';

class RoadMapController extends GetxController {
  var currentStep = 0.obs;

  void changeStep(int index) {
    currentStep.value = index;
  }
}
