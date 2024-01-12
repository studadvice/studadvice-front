import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:stud_advice/src/controllers/controllers.dart';
import 'package:stud_advice/src/controllers/deals/search_deals_controller.dart';
import 'package:stud_advice/src/middlewares/common/auth_interceptor.dart';

class AppDependenciesBinding extends Bindings {
  static final FirebaseAuth firebaseAuthInstance = FirebaseAuth.instance;
  static final FirebaseFirestore firebaseFirestoreInstance =
      FirebaseFirestore.instance;

  @override
  void dependencies() {
    Dio dio = Dio(BaseOptions(
      baseUrl: dotenv.env["BACKEND_BASE_URL"] ?? "http://localhost:8080",
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    ));
    dio.interceptors.add(AuthInterceptor());

    Get.put(dio, permanent: true);
    Get.put(AuthenticationController(), permanent: true);
    Get.put(UserStorageController(), permanent: true);
    Get.put(FileController(), permanent: true);
    Get.put(I18n(), permanent: true);
    Get.put(ThemeController(), permanent: true);
    Get.put(NavBarController(), permanent: true);
    Get.put(SettingsController(), permanent: true);
    Get.put(SearchCategoryController(), permanent: true);
    Get.put(DealsController(), permanent: true);
    Get.put(CustomSearchController(), permanent: true);
    Get.put(SearchDealsController(), permanent: true);
    Get.put(SearchFaqController(), permanent: true);
    Get.put(CustomSearchBarController(), permanent: true);
    // Makes the text translation available everywhere
    Get.put(DeeplTranslatorController(), permanent: true);
  }

  static void resetData() {
    DealsController dealsController = Get.find();
    dealsController.pagingController.refresh();

    SearchDealsController searchDealsController = Get.find();
    searchDealsController.pagingController.refresh();

    SearchFaqController searchFaqController = Get.find();
    searchFaqController.pagingController.refresh();

    SearchCategoryController searchCategoryController = Get.find();
    searchCategoryController.pagingController.refresh();

    AdministrativeProcessController administrativeProcessController =
        Get.find();
    administrativeProcessController.pagingController.refresh();
  }
}
