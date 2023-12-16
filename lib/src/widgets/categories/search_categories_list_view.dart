import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:get/get.dart';
import 'package:stud_advice/src/controllers/categories/category_controller.dart';
import '../../exceptions/empty_list_indicator.dart';
import '../../exceptions/error_indicator.dart';
import '../../models/stud_advice/category.dart';
import 'category_item.dart';

class SearchCategoriesListView extends StatelessWidget {
  const SearchCategoriesListView({
    super.key,
    required this.query,
  });

  final String query;

  @override
  Widget build(BuildContext context) {
    return _SearchCategoriesListView(query: query);
  }
}

class _SearchCategoriesListView extends StatefulWidget {
  const _SearchCategoriesListView({
    required this.query,
  });

  final String query;

  @override
  __SearchCategoriesListViewState createState() => __SearchCategoriesListViewState();
}

class __SearchCategoriesListViewState extends State<_SearchCategoriesListView> {
  final _pagingController = PagingController<int, CategoryContent>(
    firstPageKey: 0,
  );

  late CategoryController _controller;

  @override
  void initState() {
    super.initState();
    _controller = Get.find<CategoryController>();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newPage = await _controller.getCategoriesBySearch(
        number: pageKey,
        size: 5,
        query: widget.query,
      );

      final isLastPage = newPage.last;
      final newItems = newPage.content;
      if (newItems != null) {
        if (isLastPage) {
          _pagingController.appendLastPage(newItems);
        } else {
          final nextPageKey = pageKey + 1;
          _pagingController.appendPage(newItems, nextPageKey);
        }
      } else {
        _pagingController.appendLastPage([]);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => RefreshIndicator(
    onRefresh: () => Future.sync(
          () => _pagingController.refresh(),
    ),
    child: PagedListView.separated(
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<CategoryContent>(
        itemBuilder: (context, categoryItem, index) => CategoryItem(
          category: categoryItem,
        ),
        firstPageErrorIndicatorBuilder: (context) => ErrorIndicator(
          error: _pagingController.error,
          onTryAgain: () => _pagingController.refresh(),
        ),
        noItemsFoundIndicatorBuilder: (context) => EmptyListIndicator(),
      ),
      padding: const EdgeInsets.all(16),
      separatorBuilder: (context, index) => const SizedBox(
        height: 16,
      ),
    ),
  );
}
