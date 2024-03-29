import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:stud_advice/stud_advice.dart';

class DealsController extends CustomSearchController {
  final Dio _dio = Get.find();

  final PagingController<int, DealContent> pagingController =
      PagingController(firstPageKey: 0);
  final DeeplTranslatorController _deeplTranslatorController = Get.find();

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
      final newPage = await getDealsBySearch(
        number: pageKey,
        size: 5,
        query: searchQuery.value,
      );

      final isLastPage = newPage.last;
      final newItems = newPage.content;

      // Translate the text if the locale is not French
      if (Get.locale?.languageCode != 'fr') {
        for (var item in newItems) {
          item.title =
              await _deeplTranslatorController.translateText(item.title);
          debugPrint('Translated title: ${item.title}');
          item.description =
              await _deeplTranslatorController.translateText(item.description);
          debugPrint('Translated description: ${item.description}');
          if (item.category != null) {
            item.category =
                await _deeplTranslatorController.translateText(item.category!);
            debugPrint('Translated category: ${item.category}');
          }
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
      debugPrint(error.toString());
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

  Future<Deals> _getDealsBySearch(
      String path, Map<String, dynamic> queryParameters) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
      );
      if (response.statusCode == HttpStatus.ok) {
        var deals = Deals.fromJson(response.data);
        // Translate the text if the locale is not French
        if (Get.locale?.languageCode != 'fr') {
          for (var item in deals.content) {
            item.title =
                await _deeplTranslatorController.translateText(item.title);
            debugPrint('Translated title: ${item.title}');
            item.description = await _deeplTranslatorController
                .translateText(item.description);
            debugPrint('Translated description: ${item.description}');
            if (item.category != null) {
              item.category = await _deeplTranslatorController
                  .translateText(item.category!);
              debugPrint('Translated category: ${item.category}');
            }
          }
        }
        return deals;
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<Deals> _getRecommendedDeals(
      String path, Map<String, dynamic> queryParameters) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
      );
      if (response.statusCode == HttpStatus.ok) {
        var deals = Deals.fromJson(response.data);
        // Translate the text if the locale is not French
        if (Get.locale?.languageCode != 'fr') {
          for (var item in deals.content) {
            item.title =
                await _deeplTranslatorController.translateText(item.title);
            debugPrint('Translated title: ${item.title}');
            item.description = await _deeplTranslatorController
                .translateText(item.description);
            debugPrint('Translated description: ${item.description}');
            if (item.category != null) {
              item.category = await _deeplTranslatorController
                  .translateText(item.category!);
              debugPrint('Translated category: ${item.category}');
            }
          }
        }
        return deals;
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<Deals> getDealsBySearch({
    required int number,
    required int size,
    String? query,
  }) async {
    final queryParameters = {'page': number, 'size': size, 'searchText': query};
    return _getDealsBySearch('/deals/search', queryParameters);
  }

  Future<Deals> getRecommendedDeals({
    required int number,
    required int size,
  }) async {
    final queryParameters = {'page': number, 'size': size};
    return _getRecommendedDeals('/deals/recommendations', queryParameters);
  }
}
