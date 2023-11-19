import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:stud_advice/src/services/connectivity/connectivity_service.dart';
import 'package:stud_advice/src/services/init_time/init_time_service.dart';
import 'package:stud_advice/src/services/login/login_service.dart';
import 'package:stud_advice/src/services/register/register_service.dart';
import 'package:stud_advice/src/services/register/register_user_information_service.dart';

import 'routes_configuration.dart';

void setupDependenciesInjection() {
  // Register the chore services.
  Get.put(Dio());

  // Register the use cases services.
  Get.put<RoutesConfiguration>(RoutesConfiguration());
  Get.put<ConnectivityService>(ConnectivityService());
  Get.lazyPut<InitTimeService>(() => InitTimeService());
  Get.lazyPut<LoginService>(() => LoginService());
  Get.lazyPut<RegisterService>(() => RegisterService());
  Get.lazyPut<RegisterUserInformationService>(
      () => RegisterUserInformationService());
}
