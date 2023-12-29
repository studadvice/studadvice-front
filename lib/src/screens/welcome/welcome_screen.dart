import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stud_advice/stud_advice.dart';

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
        } else if (snapshot.hasData) {
          // The user is logged in.
          return NavigationBarScreen();
        } else {
          // The user is NOT logged in.
          return InitTimeScreen();
        }
      },
    );
  }
}
