import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:stud_advice/src/models/stud_advice/category.dart';
import '../../../repositories/stud_advice/stud_advice.dart';
import '../exception_indicators/empty_list_indicator.dart';
import '../exception_indicators/error_indicator.dart';
import '../categories/category.dart';

class SearchCategoriesPagedListView extends StatefulWidget {
  const SearchCategoriesPagedListView({
    required this.repository,
    required this.query,
    super.key,
  });

  final StudAdviceRepository repository;
  final String query;

  @override
  _SearchCategoriesPagedListViewState createState() => _SearchCategoriesPagedListViewState();
}

class _SearchCategoriesPagedListViewState extends State<SearchCategoriesPagedListView> {


  final _pagingController = PagingController<int, CategoryContent>(
    firstPageKey: 0,
  );

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newPage = await widget.repository.getCategoriesBySearch(
        number: pageKey,
        size: 5,
        query: widget.query
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
      }
      else{
        _pagingController.appendLastPage([]);
      }
    } catch (error) {
      print(error);
      _pagingController.error = error;
    }
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(SearchCategoriesPagedListView oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) => RefreshIndicator(
    onRefresh: () => Future.sync(
          () => _pagingController.refresh(),
    ),
    child: PagedListView.separated(
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<CategoryContent>(
        itemBuilder: (context, categoryItem, index) => Category(
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
