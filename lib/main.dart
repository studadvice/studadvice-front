import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stud_advice/common/conf/routes_configuration.dart';

import 'common/conf/injection_container.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
        textTheme: GoogleFonts.latoTextTheme(
          // Use Lato as default text style according to the graphic charter.
          Theme.of(context).textTheme,
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesConfiguration.initialRoute,
      routes: routesConfiguration.configureRoutes(),
    );
  }
}
