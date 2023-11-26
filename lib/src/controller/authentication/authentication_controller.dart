import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:stud_advice/src/common/conf/app_dependencies_binding.dart';

class AuthenticationController extends GetxController {
  var firebaseAuthInstance = AppDependenciesBinding.firebaseAuthInstance;

  // The user model used here is the firebase one.
  Rx<User?> user = Rx<User?>(null);

  @override
  void onInit() {
    super.onInit();
    user.bindStream(firebaseAuthInstance.authStateChanges());
  }

  Future<bool> signUpWithEmailAndPassword(String email, String password) async {
    await firebaseAuthInstance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    return true;
  }

  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    await firebaseAuthInstance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return true;
  }

  Future<bool> signInWithGoogle() async {
    // Trigger the authentication flow.
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request.
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential.
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential.
    final credentials =
        await FirebaseAuth.instance.signInWithCredential(credential);

    debugPrint("credentials : $credentials");
    if (credentials.user != null) {
      return true;
    }
    debugPrint('result : false');
    return false;
  }

  Future<bool> signOut() async {
    if (GoogleSignIn().currentUser != null) {
      debugPrint('signOut from google');
      await GoogleSignIn().signOut();
    }

    await firebaseAuthInstance.signOut();
    return true;
  }
}
