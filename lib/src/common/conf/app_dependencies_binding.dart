import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:stud_advice/src/controller/connectivity/connectivity_controller.dart';

class AppDependenciesBinding extends Bindings {
  @override
  void dependencies() {
    // Register the chore services.
    Get.put(Dio());

    // Register the use cases services.
    Get.put<ConnectivityController>(ConnectivityController());
  }
}
