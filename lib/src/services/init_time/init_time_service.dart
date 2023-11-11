import 'package:flutter/material.dart';
import 'package:stud_advice/src/screens/register/register_options_screen.dart';

import '../../screens/login/login_screen.dart';

class InitTimeService {
  void navigateToRegisterPage(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const RegisterOptionsScreen()));
  }

  void navigateToLoginPage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }
}
