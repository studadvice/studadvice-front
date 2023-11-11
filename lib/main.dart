import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stud_advice/src/common/chore/app_colors.dart';
import 'package:stud_advice/src/common/chore/supported_locales.dart';
import 'package:stud_advice/src/common/conf/injection_container.dart';
import 'package:stud_advice/src/common/conf/routes_configuration.dart';

void main() {
  setupDependenciesInjection();
  runApp(const StudAdviceApp());
}

class StudAdviceApp extends StatelessWidget {
  const StudAdviceApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    RoutesConfiguration routesConfiguration = locator<RoutesConfiguration>();

    return MaterialApp(
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
      routes: routesConfiguration.configureRoutes(),
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
