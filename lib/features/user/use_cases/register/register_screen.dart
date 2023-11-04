import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  static const String navigatorId = 'register_screen';

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(
          child: Text('Register Screen'),
        ),
      );
}
