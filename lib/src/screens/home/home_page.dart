import 'package:flutter/material.dart';
import 'package:stud_advice/src/common/chore/app_fonts_sizes.dart';

class HomePageScreen extends StatefulWidget {
  static const navigatorId = 'home_page';

  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to the Home Page!',
              style: TextStyle(
                  fontSize: AppFontSizes.extraLarge,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
