import 'package:flutter/material.dart';
import 'package:stud_advice/src/common/chore/app_fonts_sizes.dart';

class HomePageScreen extends StatefulWidget {
  static const navigatorId = '/home_page_screen';

  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const SizedBox(
            height: 40,
            child: Image(
              image: AssetImage('assets/images/common/raven_image.png'),
            ),
          )),
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
