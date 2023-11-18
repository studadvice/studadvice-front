import 'package:flutter/cupertino.dart';

class LoginService {
  Future<bool> loginWithEmailAndPassword(String email, String password) async {
    // TODO: implement loginWithEmailAndPassword
    debugPrint("email: $email, password: $password");
    return true;
  }

  Future<bool> loginWithPseudoAndPassword(
      String pseudo, String password) async {
    debugPrint("pseudo: $pseudo, password: $password");
    // TODO: implement loginWithPseudoAndPassword
    return true;
  }

  Future<bool> loginWithFacebookAccount() async {
    // TODO: implement loginWithFacebook
    return true;
  }

  Future<bool> loginWithGoogleAccount() async {
    // TODO: implement loginWithGoogle
    return true;
  }

  Future<bool> loginWithAppleAccount() async {
    // TODO: implement loginWithGoogle
    return true;
  }

  Future<bool> loginWithXAccount() async {
    // TODO: implement loginWithGoogle
    return true;
  }
}
