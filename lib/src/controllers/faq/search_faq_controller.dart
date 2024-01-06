import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:stud_advice/src/controllers/search/custom_search_controller.dart';
import 'package:stud_advice/stud_advice.dart';

import '../../models/stud_advice/faq.dart';

class SearchFaqController extends CustomSearchController {
  final Dio _dio = Get.find();
  final DeeplTranslatorController _deeplTranslatorController = Get.find();

  final PagingController<int, FaqContent> pagingController =
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
      final newPage = await getFaqBySearch(
        number: pageKey,
        size: 5,
        query: searchQuery.value,
      );

      final isLastPage = newPage.last;
      final newItems = newPage.content;

      // Translate the text if the locale is not French
      if (Get.locale?.languageCode != 'fr') {
        for (var item in newItems) {
          item.question =
              await _deeplTranslatorController.translateText(item.question);
          item.response =
              await _deeplTranslatorController.translateText(item.response);
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

  Future<Faq> _getFaqBySearch(
      String path, Map<String, dynamic> queryParameters) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
      );

      if (response.statusCode == HttpStatus.ok) {
        return Faq.fromJson(response.data);
      } else {
        throw Exception('Failed to load faq');
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<Faq> getFaqBySearch({
    required int number,
    required int size,
    String? query,
  }) async {
    final queryParameters = {'page': number, 'size': size, 'searchText': query};
    return _getFaqBySearch('/faq/search', queryParameters);
  }
}
