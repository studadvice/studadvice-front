import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../../../repositories/stud_advice/stud_advice.dart';
import '../exception_indicators/empty_list_indicator.dart';
import '../exception_indicators/error_indicator.dart';
import '../preferences/list_preferences.dart';
import 'list_item.dart';

class PagedArticleListView extends StatefulWidget {
  const PagedArticleListView({
    required this.repository,
    this.listPreferences,
    super.key,
  });

  final StudAdviceRepository repository;
  final ListPreferences? listPreferences;

  @override
  _PagedArticleListViewState createState() => _PagedArticleListViewState();
}

class _PagedArticleListViewState extends State<PagedArticleListView> {

  ListPreferences? get _listPreferences => widget.listPreferences;

  final _pagingController = PagingController<int, String>(
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
      final newPage = await widget.repository.getCategories(
        number: pageKey,
        size: 5,
      );

      final previouslyFetchedItemsCount =
          _pagingController.itemList?.length ?? 0;

      //final isLastPage = newPage.isLastPage(previouslyFetchedItemsCount);
      //final newItems = newPage.itemList;

      if (false) {
        //_pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(newPage, nextPageKey);
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
  void didUpdateWidget(PagedArticleListView oldWidget) {
    if (oldWidget.listPreferences != widget.listPreferences) {
      _pagingController.refresh();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) => RefreshIndicator(
        onRefresh: () => Future.sync(
          () => _pagingController.refresh(),
        ),
        child: PagedListView.separated(
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<String>(
            itemBuilder: (context, categoryItem, index) => CategoryListItem(
              category: categoryItem
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
