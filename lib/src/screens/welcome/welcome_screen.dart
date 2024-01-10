import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/src/controllers/common/navbar_controller.dart';
import 'package:stud_advice/stud_advice.dart';

class WelcomeScreen extends StatelessWidget {
  static const String navigatorId = '/welcome_screen';
  final NavBarController navbarController = Get.find<NavBarController>();

  WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return StreamBuilder<User?>(
      stream: AppDependenciesBinding.firebaseAuthInstance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                color: AppColors.secondaryColor,
              ),
            ),
          );
        } else if (snapshot.hasData) {
          // The user is logged in.
          navbarController.resetTabIndex();
          return NavigationBarScreen();
        } else {
          // The user is NOT logged in.
          return InitTimeScreen();
        }
      },
    );
  }
}
