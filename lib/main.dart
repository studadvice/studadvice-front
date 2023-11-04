import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stud_advice/features/user/use_cases/init_time/init_time_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Stud'Advice",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
        textTheme: GoogleFonts.latoTextTheme( // Use Lato as default text style according to the graphic charter.
          Theme.of(context).textTheme,
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: InitTimeScreen.navigatorId,
      routes: {
        InitTimeScreen.navigatorId: (context) => const InitTimeScreen(),
      },
    );
  }
}
