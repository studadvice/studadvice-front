import 'package:flutter/cupertino.dart';
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
    return Scaffold(
      body: Center(
        child: Container(
          child: const Text('Welcome Screen'),
        ),
      ),
    );
  }
}