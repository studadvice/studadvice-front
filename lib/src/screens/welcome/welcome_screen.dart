import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stud_advice/src/common/chore/app_colors.dart';
import 'package:stud_advice/src/common/conf/app_dependencies_binding.dart';
import 'package:stud_advice/src/screens/home/home_page.dart';
import 'package:stud_advice/src/screens/init_time/init_time_screen.dart';

class WelcomeScreen extends StatelessWidget {
  static const String navigatorId = '/welcome_screen';

  const WelcomeScreen({super.key});

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
            child: CircularProgressIndicator(
              color: AppColors.secondaryColor,
              strokeWidth: 5,
            ),
          );
        } else {
          // The user is logged in.
          if (snapshot.hasData) {
            return const HomePageScreen();
          }

          // The user is NOT logged in.
          return InitTimeScreen();
        }
      },
    );
  }
}
