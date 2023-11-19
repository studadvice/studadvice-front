import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:stud_advice/src/controller/connectivity/connectivity_controller.dart';
import 'package:stud_advice/src/services/init_time/init_time_service.dart';
import 'package:stud_advice/src/services/login/login_service.dart';
import 'package:stud_advice/src/services/register/register_service.dart';
import 'package:stud_advice/src/services/register/register_user_information_service.dart';

class AppDependenciesBinding extends Bindings {
  @override
  void dependencies() {
    // Register the chore services.
    Get.put(Dio());

    // Register the use cases services.
    Get.put<ConnectivityController>(ConnectivityController());
    Get.lazyPut<InitTimeService>(() => InitTimeService());
    Get.lazyPut<LoginService>(() => LoginService());
    Get.lazyPut<RegisterService>(() => RegisterService());
    Get.lazyPut<RegisterUserInformationService>(
        () => RegisterUserInformationService());
  }
}
