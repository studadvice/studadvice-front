import 'package:country_picker/country_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:stud_advice/firebase_options.dart';
import 'package:stud_advice/stud_advice.dart';


class StudAdviceApp extends StatelessWidget {

  const StudAdviceApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final ConnectivityController connectivityController =
    //     Get.put(ConnectivityController());
    //
    // Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
    //   connectivityController.checkConnectivity(result);
    // });

    final RoutesConfiguration routesConfiguration =
        Get.put(RoutesConfiguration());

    // return GetMaterialApp.router(
    return GetMaterialApp(
      title: "Stud'Advice",
      theme: Styles.lightTheme,
      darkTheme: Styles.darkTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesConfiguration.initialRoute,
      initialBinding: AppDependenciesBinding(),
      getPages: routesConfiguration.configureRoutes(),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        CountryLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      locale: CustomLocale('fr', 'FR'),
      supportedLocales: [const Locale('en', 'US'), const Locale('fr', 'FR')],
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const StudAdviceApp());
}
