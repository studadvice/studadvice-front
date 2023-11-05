import 'package:flutter/material.dart';
import 'package:stud_advice/features/user/use_cases/register/register_screen.dart';

import '../../login/screens/login_screen.dart';

class InitTimeService {
  void navigateToRegisterPage(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const RegisterScreen()));
  }

  void navigateToLoginPage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }
}
