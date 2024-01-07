import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../../stud_advice.dart';
import 'dart:io';

class DealDetailController extends GetxController {
  var _firebaseFirestoreInstance = AppDependenciesBinding.firebaseFirestoreInstance;
  final Dio _dio = Get.find();
  var userRatings = <String, int>{}.obs;

  @override
  void onInit() {
    super.onInit();
    initUserRatings();
  }


  Future<DealContent> _rateDeal(
      String path, Map<String, dynamic> queryParameters) async {
    try {
      final response = await _dio.post(
        path,
        queryParameters: queryParameters,
      );
      if (response.statusCode == HttpStatus.ok) {
        return DealContent.fromJson(response.data);
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<DealContent> rateDeal({
    required String dealId,
    required int rating,
    String? query,
  }) async {
    final queryParameters = {'rating': rating};
    return _rateDeal('/deals/$dealId/rate', queryParameters);
  }

  Future<void> initUserRatings() async {
    try {
      var userRatingsCollection = await _firebaseFirestoreInstance.collection("user_ratings").get();

      for (var ratingDoc in userRatingsCollection.docs) {
        var dealId = ratingDoc.id;
        userRatings[dealId] = ratingDoc["rating"];
      }
    } catch (e) {
      print("Error initializing user ratings: $e");
    }
  }


  Future<void> setUserRating(String dealId, int rating) async {
    bool hasAlreadyRated = await isRated(dealId);
    if (!hasAlreadyRated) {
      saveRating(dealId, rating);
      userRatings[dealId] = rating;
    }
  }

  Future<bool> isRated(String dealId) async {
    try {
      var doc = await _firebaseFirestoreInstance
          .collection("user_ratings")
          .doc(dealId)
          .get();

      return doc.exists;
    } catch (e) {
      print("Error checking if deal is rated: $e");
      return false;
    }
  }

  void saveRating(String dealId, int rating) {
    _firebaseFirestoreInstance.collection("user_ratings").doc(dealId).set({
      "dealId": dealId,
      "rating": rating,
    });
  }
}
