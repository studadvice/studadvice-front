import 'package:flutter/material.dart';

class RegisterWithEmailScreen extends StatefulWidget {
  static const String navigatorId = 'register_with_email_screen';

  const RegisterWithEmailScreen({Key? key}) : super(key: key);

  @override
  State<RegisterWithEmailScreen> createState() =>
      _RegisterWithEmailScreenState();
}

class _RegisterWithEmailScreenState extends State<RegisterWithEmailScreen> {
  // Use constants to facilitate the implementation of the translation.

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: const Center(child: Text('Register with email screen')));
  // column
// email
// password
// confirm password
// i agree to the terms and conditions
// register button
}
