import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const String navigatorId = 'login_screen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(
          child: Text('Login Screen'),
        ),
      );
}
