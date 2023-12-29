import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:stud_advice/src/controllers/search/custom_search_controller.dart';
import 'package:stud_advice/stud_advice.dart';

class FavoriteAdministrativeProcessController extends CustomSearchController {
  final RxList<String> _favoritesAdministrativeProcessesId = <String>[].obs;

  UserStorageController userStorageController = Get.find();
  final Dio _dio = Get.find();

  List<String> get favoriteAdministrativeProcessesId =>
      _favoritesAdministrativeProcessesId;

  final pagingController = PagingController<int, AdministrativeProcessContent>(
    firstPageKey: 0,
  );

  @override
  void onInit() {
    super.onInit();
    _fetchFavorites();

    pagingController.addPageRequestListener((pageKey) {
      fetchPage(pageKey);
    });
  }

  Future<AdministrativeProcesses> fetchAllPages(int pageKey, int pageSize,
      TextEditingController textEditingController) async {
    try {
      AdministrativeProcesses newPage = await getAdministrativeProcesses(
          number: pageKey, size: pageSize, query: textEditingController.text);

      int totalPages = newPage.totalPages;

      List<AdministrativeProcessContent> allContent = newPage.content;

      // Vérifier si d'autres pages sont disponibles
      if (pageKey < totalPages) {
        AdministrativeProcesses nextPageResult =
            await fetchAllPages(pageKey + 1, pageSize, textEditingController);
        allContent.addAll(nextPageResult.content);
      }

      return AdministrativeProcesses(
        content: allContent,
        pageable: newPage.pageable,
        totalElements: newPage.totalElements,
        totalPages: newPage.totalPages,
        last: newPage.last,
        size: newPage.size,
        number: newPage.number,
        sort: newPage.sort,
        numberOfElements: newPage.numberOfElements,
        first: newPage.first,
        empty: newPage.empty,
      );
    } catch (error) {
      debugPrint('Error fetching pages: $error');
      rethrow;
    }
  }

  @override
  Future<void> fetchPage(int pageKey) async {
    try {
      final AdministrativeProcesses newPage =
          await fetchAllPages(pageKey, 100, textEditingController);

      final newItems = newPage.content;

      var favoriteAdministrativeProcesses =
          newItems.where((process) => isProcessFavorite(process.id)).toList();

      pagingController.appendLastPage(favoriteAdministrativeProcesses);
    } catch (error) {
      pagingController.error = error;
    }
  }

  Future<AdministrativeProcesses> getAdministrativeProcesses(
      {required int number, required int size, String? query}) async {
    final queryParameters = {
      'page': number,
      'size': size,
      'searchText': query,
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

  Future<void> toggleFavoriteState(String administrativeProcessId) async {
    String userId = userStorageController.getCurrentUserId();
    _fetchFavorites();

    if (isProcessFavorite(administrativeProcessId)) {
      await userStorageController.removeAdministrativeProcessFromFavorites(
          userId, administrativeProcessId);
      _favoritesAdministrativeProcessesId.remove(administrativeProcessId);
    } else {
      await userStorageController.addAdministrativeProcessToFavorites(
          userId, administrativeProcessId);
      _favoritesAdministrativeProcessesId.add(administrativeProcessId);
    }
    update();
  }

  Future<void> _fetchFavorites() async {
    String userId = userStorageController.getCurrentUserId();

    List<String> favoriteIds = await userStorageController.getFavorites(userId);

    _favoritesAdministrativeProcessesId.clear();

    _favoritesAdministrativeProcessesId.addAll(favoriteIds);
  }

  bool isProcessFavorite(String administrativeProcessId) {
    var res = _favoritesAdministrativeProcessesId
        .any((processId_) => processId_ == administrativeProcessId);
    return res;
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
}
