import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:stud_advice/stud_advice.dart';

class AdministrativeProcessController extends CustomSearchController {
  final RxList<dynamic> _favoritesAdministrativeProcessesId = <dynamic>[].obs;
  var _firebaseFirestoreInstance =
      AppDependenciesBinding.firebaseFirestoreInstance;
  UserStorageController userStorageController = Get.find();
  final Dio _dio = Get.find();
  final DeeplTranslatorController _deeplTranslatorController = Get.find();
  late String categoryId;
  List<dynamic> get favoriteAdministrativeProcesses =>
      _favoritesAdministrativeProcessesId;

  final pagingController = PagingController<int, AdministrativeProcessContent>(
    firstPageKey: 0,
  );

  @override
  void onInit() {
    super.onInit();
    pagingController.addPageRequestListener((pageKey) {
      fetchPage(pageKey);
    });
    _initFavorites();
  }

  @override
  Future<void> fetchPage(int pageKey) async {
    try {
      final AdministrativeProcesses newPage = await getAdministrativeProcesses(
          number: pageKey,
          size: 5,
          query: textEditingController.text,
          categoryId: categoryId);

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

      if (isLastPage) {
        pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }

  Future<AdministrativeProcesses> getAdministrativeProcesses(
      {required int number,
      required int size,
      String? query,
      String? categoryId}) async {
    final queryParameters = {
      'page': number,
      'size': size,
      'searchText': query,
      'categoryId': categoryId
    };
    return _getAdministrativeProcesses(
        '/administrative-process/search', queryParameters);
  }

  Future<AdministrativeProcesses> _getAdministrativeProcesses(
      String path, Map<String, dynamic> queryParameters) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
      );
      if (response.statusCode == HttpStatus.ok) {
        return AdministrativeProcesses.fromJson(response.data);
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<void> toggleFavoriteState(
      String administrativeProcessId, String categoryId) async {
    String userId = userStorageController.getCurrentUserId();

    if (isProcessFavorite(administrativeProcessId)) {
      await userStorageController.removeAdministrativeProcessFromFavorites(
          userId, administrativeProcessId, categoryId);
      _favoritesAdministrativeProcessesId.remove(administrativeProcessId);
    } else {
      await userStorageController.addAdministrativeProcessToFavorites(
          userId, administrativeProcessId, categoryId);
      _favoritesAdministrativeProcessesId.add(administrativeProcessId);
    }
  }

  Future<void> _initFavorites() async {
    String userId = userStorageController.getCurrentUserId();

    List<dynamic> favoriteIds =
        await userStorageController.getFavorites(userId);

    _favoritesAdministrativeProcessesId.addAll(favoriteIds);
  }

  bool isProcessFavorite(String administrativeProcessId) {
    return _favoritesAdministrativeProcessesId
        .any((processId_) => processId_ == administrativeProcessId);
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

  Future<double> getProgressValue(String administrativeId) async {
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

          var progressEntry = progressList.firstWhere(
            (entry) =>
                entry is Map &&
                entry.containsKey("administrativeProcessId") &&
                entry["administrativeProcessId"] == administrativeId,
            orElse: () => null,
          );

          if (progressEntry != null &&
              progressEntry.containsKey("stepIndex") &&
              progressEntry.containsKey("totalStepsNumber")) {
            int stepIndex = (progressEntry["stepIndex"]) ?? 0.0;
            int totalStepsNumber = (progressEntry["totalStepsNumber"]) ?? 1.0;
            return totalStepsNumber != 0.0
                ? (stepIndex / totalStepsNumber)
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
