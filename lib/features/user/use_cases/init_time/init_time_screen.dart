import 'package:flutter/material.dart';

class InitTimeScreen extends StatefulWidget {
  static const String navigatorId = 'init_time_screen';
  const InitTimeScreen({Key? key}) : super(key: key);

  @override
  State<InitTimeScreen> createState() => _InitTimeScreenState();
}

class _InitTimeScreenState extends State<InitTimeScreen>  {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Welcome Screen'),
      ),
    );
  }
}