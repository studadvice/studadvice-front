import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:stud_advice/src/controllers/search/custom_search_controller.dart';
import 'package:stud_advice/stud_advice.dart';

class SearchCategoryController extends CustomSearchController {
  final Dio _dio = Get.find();
  final DeeplTranslatorController _deeplTranslatorController = Get.find();

  final PagingController<int, CategoryContent> pagingController =
      PagingController(firstPageKey: 0);

  final Set<String> loadedItems = {};

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

      final uniqueNewItems =
          newItems.where((item) => !loadedItems.contains(item.id)).toList();

      for (var item in uniqueNewItems) {
        loadedItems.add(item.id);
      }

      // Translate the text if the locale is not French
      if (Get.locale?.languageCode != 'fr') {
        for (var item in uniqueNewItems) {
          item.name = await _deeplTranslatorController.translateText(item.name);
          item.description =
              await _deeplTranslatorController.translateText(item.description);
        }
      }
      if (uniqueNewItems.isNotEmpty) {
        if (isLastPage) {
          pagingController.appendLastPage(uniqueNewItems);
        } else {
          final nextPageKey = pageKey + 1;
          pagingController.appendPage(uniqueNewItems, nextPageKey);
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
}
