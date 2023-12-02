import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:stud_advice/src/controllers/authentication/authentication_controller.dart';
import 'package:stud_advice/src/controllers/common/i18n_controller.dart';
import 'package:stud_advice/src/controllers/common/theme_controller.dart';

class AppDependenciesBinding extends Bindings {
  static final FirebaseAuth firebaseAuthInstance = FirebaseAuth.instance;
  static final FirebaseFirestore firebaseFirestoreInstance =
      FirebaseFirestore.instance;

  @override
  void dependencies() {
    // Register the chore services.
    Get.put(Dio());

    // Language and theme controllers.
    Get.put(I18n());
    Get.put(ThemeController());

    // Register the firebase services.
    Get.put(AuthenticationController());
  }
}
