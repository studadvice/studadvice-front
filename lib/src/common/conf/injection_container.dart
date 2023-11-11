import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:stud_advice/src/common/conf/routes_configuration.dart';
import 'package:stud_advice/src/services/init_time/init_time_service.dart';
import 'package:stud_advice/src/services/login/login_service.dart';
import 'package:stud_advice/src/services/register/register_user_information_service.dart';

final locator = GetIt.instance;

// Used to setup the dependency injection.
// This is called before the app is run.
void setupDependenciesInjection() {
  // Register the chore services.
  locator.registerFactory(() => (Dio()));

  // Register the use cases services.
  locator.registerSingleton<RoutesConfiguration>(RoutesConfiguration());
  locator.registerLazySingleton<InitTimeService>(() => InitTimeService());
  locator.registerLazySingleton<LoginService>(() => LoginService());
  locator.registerLazySingleton<RegisterUserInformationService>(
      () => RegisterUserInformationService());
}
