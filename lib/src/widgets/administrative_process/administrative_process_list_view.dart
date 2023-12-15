import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:stud_advice/src/widgets/administrative_process/administrative_process_tile.dart';
import 'package:stud_advice/stud_advice.dart';

class AdministrativeProcessListView extends StatefulWidget {
  final String categoryId;
  final String categoryColor;

  const AdministrativeProcessListView({
    super.key,
    required this.categoryId,
    required this.categoryColor,
  });

  @override
  State<AdministrativeProcessListView> createState() =>
      _AdministrativeProcessListViewState();
}

class _AdministrativeProcessListViewState
    extends State<AdministrativeProcessListView> {
  final _pagingController = PagingController<int, AdministrativeProcess>(
    firstPageKey: 0,
  );

  late AdministrativeProcessController _controller;

  @override
  void initState() {
    super.initState();
    _controller = Get.find<AdministrativeProcessController>();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  Future<void> _fetchPage(int pageKey) async {
    int size = 5;
    try {
      final newPage = await _controller.fetchAdministrativeProcesses(
        widget.categoryId,
        pageKey,
        size,
      );

      final isLastPage = newPage['last'] as bool;
      final newItems = newPage['content'] as List<AdministrativeProcess>;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(newItems, nextPageKey);
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
          builderDelegate: PagedChildBuilderDelegate<AdministrativeProcess>(
            itemBuilder: (context, categoryItem, index) =>
                AdministrativeProcessListTile(
              name: categoryItem.name,
              imageFileSrc: categoryItem.imageId,
              description: categoryItem.description,
              showProgressBar:
                  false, // TODO set this to true when the user when the progress bar is needed.
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
