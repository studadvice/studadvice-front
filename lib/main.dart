import 'package:country_picker/country_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:stud_advice/src/common/chore/styles.dart';
import 'package:stud_advice/src/controllers/common/i18n_controller.dart';
import 'package:stud_advice/src/controllers/common/theme_controller.dart';

import 'firebase_options.dart';
import 'src/common/conf/routes_configuration.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // setupDependenciesInjection();
  final ThemeController themeController = Get.put(ThemeController());
  final I18n i18n = Get.put(I18n());
  final RoutesConfiguration routesConfiguration = Get.put(RoutesConfiguration());

  runApp( StudAdviceApp(
          themeController: themeController,
          i18n: i18n,
          routesConfiguration: routesConfiguration));
}

class StudAdviceApp extends StatelessWidget {
  final ThemeController themeController;
  final I18n i18n;
  final RoutesConfiguration routesConfiguration;

  StudAdviceApp(
      {required this.themeController,
      required this.i18n,
      required this.routesConfiguration});

  @override
  Widget build(BuildContext context) {
    // final ConnectivityController connectivityController =
    //     Get.put(ConnectivityController());
    //
    // Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
    //   connectivityController.checkConnectivity(result);
    // });

    return GetMaterialApp.router(
          title: "Stud'Advice",
          theme: Styles.lightTheme,
          darkTheme: Styles.darkTheme,
          themeMode: themeController.getThemeMode(),
          debugShowCheckedModeBanner: false,
          getPages: routesConfiguration.configureRoutes(),
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            CountryLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          locale: i18n.getCurrentLocale,
          supportedLocales: [
            const Locale('en', 'US'),
            const Locale('fr', 'FR')
          ],
        );
  }
}
