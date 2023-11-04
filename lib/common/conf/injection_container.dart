import 'package:get_it/get_it.dart';
import 'package:stud_advice/common/conf/routes_configuration.dart';

import '../../features/user/use_cases/init_time/init_time_service.dart';

final locator = GetIt.instance;

// Used to setup the dependency injection.
// This is called before the app is run.
void setupDependenciesInjection() {
  locator.registerSingleton<RoutesConfiguration>(RoutesConfiguration());
  locator.registerLazySingleton<InitTimeService>(() => InitTimeService());
}
