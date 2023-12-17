import 'package:dio/dio.dart';
import 'package:get/get.dart';

class StepController extends GetxController {

  final _dio = Get.find<Dio>();

  var currentStep = 0.obs;

  void changeStep(int index) {
    currentStep.value = index;
  }
}
