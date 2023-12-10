import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:stud_advice/src/controllers/controllers.dart';
import 'package:stud_advice/src/repositories/stud_advice/stud_advice.dart';

class AppDependenciesBinding extends Bindings {
  static final FirebaseAuth firebaseAuthInstance = FirebaseAuth.instance;
  static final FirebaseFirestore firebaseFirestoreInstance =
      FirebaseFirestore.instance;

  @override
  void dependencies() {
    // Register the chore services.
    Get.put(Dio(), permanent: true);
    Get.put(UserStorageController(), permanent: true);

    // Language and theme controllers.
    Get.put(I18n(), permanent: true);
    Get.put(ThemeController(), permanent: true);

    // Register the firebase services.
    Get.put(AuthenticationController(), permanent: true);
    Get.put(StudAdviceRepository(), permanent: true);
  }
}
