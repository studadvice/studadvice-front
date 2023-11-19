import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/src/screens/register/register_options_screen.dart';

import '../../screens/login/login_screen.dart';

class InitTimeService {
  void navigateToRegisterPage(BuildContext context) {
    Get.to(() => const RegisterOptionsScreen());
  }

  void navigateToLoginPage(BuildContext context) {
    Get.to(() => LoginScreen());
  }
}
