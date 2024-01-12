import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/stud_advice.dart';

class DealDetailController extends GetxController {
  var _firebaseFirestoreInstance =
      AppDependenciesBinding.firebaseFirestoreInstance;
  final Dio _dio = Get.find();
  var userRatings = <String, int>{}.obs;
  UserStorageController userStorageController = Get.find();
  late String _userId;

  @override
  void onInit() {
    super.onInit();
    _userId = userStorageController.getCurrentUserId();
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
    final queryParameters = {
      'rating': rating,
      'userId': _userId,
    };
    return _rateDeal('/deals/$dealId/rate', queryParameters);
  }

  Future<void> initUserRatings() async {
    try {
      var userRatingsDoc = await _firebaseFirestoreInstance
          .collection("users")
          .doc(_userId)
          .get();

      if (userRatingsDoc.exists) {
        var ratingsMap =
            userRatingsDoc.data()?["ratings"] as Map<String, dynamic>? ?? {};
        userRatings.value = Map<String, int>.from(ratingsMap);
      } else {
        debugPrint("User document not found or does not exist");
      }
    } catch (e) {
      debugPrint("Error initializing user ratings: $e");
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
      var userRatingsDoc = await _firebaseFirestoreInstance
          .collection("users")
          .doc(_userId)
          .get();

      var ratingsMap = userRatingsDoc["ratings"] as Map<String, dynamic>? ?? {};
      return ratingsMap.containsKey(dealId);
    } catch (e) {
      debugPrint("Error checking if deal is rated: $e");
      return false;
    }
  }

  void saveRating(String dealId, int rating) {
    _firebaseFirestoreInstance.collection("users").doc(_userId).set({
      "ratings": {
        dealId: rating,
      },
    }, SetOptions(merge: true));
  }
}
