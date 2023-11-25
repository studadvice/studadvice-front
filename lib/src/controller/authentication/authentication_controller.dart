import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
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

  Future<bool> signUp(String email, String password) async {
    await firebaseAuthInstance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    return true;
  }

  Future<bool> signIn(String email, String password) async {
    await firebaseAuthInstance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return true;
  }

  Future<bool> signOut() async {
    await firebaseAuthInstance.signOut();
    return true;
  }
}
