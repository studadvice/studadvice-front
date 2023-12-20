import 'package:flutter/cupertino.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:get/get.dart';
import 'package:stud_advice/stud_advice.dart';

import '../../models/stud_advice/category.dart';

class CategoriesListController extends GetxController {
  final PagingController<int, CategoryContent> pagingController =
  PagingController(firstPageKey: 0);

  final CategoryController _controller = Get.find<CategoryController>();

  final TextEditingController textEditingController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newPage = await _controller.getCategoriesBySearch(
        number: pageKey,
        size: 5,
        query: textEditingController.text,
      );

      final isLastPage = newPage.last;
      final newItems = newPage.content;
      if (newItems != null) {
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
}
