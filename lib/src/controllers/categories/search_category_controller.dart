import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:stud_advice/stud_advice.dart';

class SearchCategoryController extends CustomSearchController {
  final Dio _dio = Get.find();
  final DeeplTranslatorController _deeplTranslatorController = Get.find();
  UserStorageController userStorageController = Get.find();
  var _firebaseFirestoreInstance =
      AppDependenciesBinding.firebaseFirestoreInstance;
  final PagingController<int, CategoryContent> pagingController =
      PagingController(firstPageKey: 0);

  @override
  void onInit() {
    super.onInit();
    pagingController.addPageRequestListener((pageKey) {
      fetchPage(pageKey);
    });
  }

  @override
  Future<void> fetchPage(int pageKey) async {
    try {
      final newPage = await getCategoriesBySearch(
        number: pageKey,
        size: 5,
        query: searchQuery.value,
      );
      final isLastPage = newPage.last;
      final newItems = newPage.content;

      // Translate the text if the locale is not French
      if (Get.locale?.languageCode != 'fr') {
        for (var item in newItems) {
          item.name = await _deeplTranslatorController.translateText(item.name);
          item.description =
              await _deeplTranslatorController.translateText(item.description);
        }
      }
      if (newItems.isNotEmpty) {
        if (isLastPage) {
          pagingController.appendLastPage(newItems);
        } else {
          final nextPageKey = pageKey + 1;
          pagingController.appendPage(newItems, nextPageKey);
        }
      } else {
        pagingController.appendLastPage([]);
      }
    } catch (error) {
      pagingController.error = error;
      debugPrint(error.toString());
    }
  }

  @override
  void onClose() {
    pagingController.dispose();
    super.onClose();
  }

  @override
  void refresh() {
    pagingController.refresh();
  }

  Future<Categories> _getCategoriesBySearch(
      String path, Map<String, dynamic> queryParameters) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
      );
      if (response.statusCode == HttpStatus.ok) {
        return Categories.fromJson(response.data);
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<Categories> getCategoriesBySearch({
    required int number,
    required int size,
    String? query,
  }) async {
    final queryParameters = {'page': number, 'size': size, 'searchText': query};
    return _getCategoriesBySearch('/categories/search', queryParameters);
  }

  Future<double> getProgressValue(CategoryContent categoryContent) async {
    try {
      String userId = userStorageController.getCurrentUserId();
      var userDocument = await _firebaseFirestoreInstance
          .collection("users")
          .doc(userId)
          .get();

      if (userDocument.exists) {
        var userData = userDocument.data();

        if (userData != null && userData.containsKey("progress")) {
          var progressList = userData["progress"] as List<dynamic>;

          var matchingEntries = progressList.where(
            (entry) =>
                entry is Map &&
                entry.containsKey("categoryId") &&
                entry["categoryId"] == categoryContent.id,
          );

          if (matchingEntries.isNotEmpty) {
            double totalProgress = matchingEntries.fold(
              0.0,
              (acc, entry) {
                if (entry.containsKey("stepIndex") &&
                    entry.containsKey("totalStepsNumber")) {
                  int stepIndex = (entry["stepIndex"]) ?? 0;
                  int totalStepsNumber = (entry["totalStepsNumber"]) ?? 1;
                  return acc +
                      (totalStepsNumber != 0
                          ? (stepIndex / totalStepsNumber)
                          : 0);
                }
                return acc;
              },
            );

            return matchingEntries.isNotEmpty
                ? totalProgress /
                    categoryContent.administrativeProcesses!.length
                : 0.0;
          }
        }
      }
    } catch (e) {
      debugPrint("Error getting progress value: $e");
    }

    return 0.0;
  }
}
