import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AppDependenciesBinding extends Bindings {
  static final FirebaseAuth firebaseAuthInstance = FirebaseAuth.instance;
  static final FirebaseFirestore firebaseFirestoreInstance =
      FirebaseFirestore.instance;

  @override
  void dependencies() {
    // Register the chore services.
    Get.put(Dio());
  }
}
