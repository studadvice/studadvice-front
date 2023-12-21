import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:stud_advice/src/controllers/categories/controller.dart';
import 'package:stud_advice/src/models/stud_advice/category.dart';

class SearchCategoryController extends CustomSearchController {
  final Dio _dio = Get.find();

  @override
  Future<void> fetchPage(int pageKey) async {
    try {
      final newPage = await getCategoriesBySearch(
        number: pageKey,
        size: 5,
        query: textEditingController.text,
      );

      final isLastPage = newPage.last;
      final newItems = newPage.content;
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

  Future<Category> _getCategoriesBySearch(
      String path, Map<String, dynamic> queryParameters) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
      );

      if (response.statusCode == HttpStatus.ok) {
        return Category.fromJson(response.data);
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<Category> getCategoriesBySearch({
    required int number,
    required int size,
    String? query,
  }) async {
    final queryParameters = {'page': number, 'size': size, 'searchText': query};
    return _getCategoriesBySearch('/categories/search', queryParameters);
  }
}
