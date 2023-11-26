import 'package:country_picker/country_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stud_advice/src/common/chore/app_colors.dart';
import 'package:stud_advice/src/common/chore/supported_locales.dart';
import 'package:stud_advice/src/common/conf/app_dependencies_binding.dart';

import 'firebase_options.dart';
import 'src/common/conf/routes_configuration.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const StudAdviceApp());
}

class StudAdviceApp extends StatelessWidget {
  const StudAdviceApp({super.key});

  @override
  Widget build(BuildContext context) {
    final RoutesConfiguration routesConfiguration =
        Get.put(RoutesConfiguration());

    final ConnectivityController connectivityController =
        Get.put(ConnectivityController());

    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      connectivityController.checkConnectivity(result);
    });

    return GetMaterialApp(
      title: "Stud'Advice",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.white),
        useMaterial3: true,
        textTheme: GoogleFonts.latoTextTheme(
          // Use Lato as default text style according to the graphic charter.
          Theme.of(context).textTheme,
        ),
      ),
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
      supportedLocales: [const Locale(english), const Locale(french)],
    );
  }
}
