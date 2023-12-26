import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:stud_advice/src/controllers/controllers.dart';
import 'package:stud_advice/src/middlewares/common/auth_interceptor.dart';

class AppDependenciesBinding extends Bindings {
  static final FirebaseAuth firebaseAuthInstance = FirebaseAuth.instance;
  static final FirebaseFirestore firebaseFirestoreInstance =
      FirebaseFirestore.instance;

  @override
  void dependencies() {
    Dio dio = Dio(
        BaseOptions(
          baseUrl: 'http://localhost:8080',
          connectTimeout: const Duration(seconds: 5),
          receiveTimeout: const Duration(seconds: 5),
        ));
    dio.interceptors.add(AuthInterceptor());

    Get.put(dio, permanent: true);
    Get.put(AuthenticationController(), permanent: true);
    Get.put(UserStorageController(), permanent: true);
    Get.put(FileController(), permanent: true);

    // Language and theme controllers.
    Get.put(I18n(), permanent: true);
    Get.put(ThemeController(), permanent: true);
  }
}
