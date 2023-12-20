import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:get/get.dart';
import 'package:stud_advice/stud_advice.dart';

import '../../controllers/categories/category_list_controller.dart';
import '../../models/stud_advice/category.dart';

class CategoriesListView extends StatelessWidget {

  const CategoriesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoriesListController>(
      init: CategoriesListController(),
      builder: (controller) {
        return RefreshIndicator(
          onRefresh: () => Future.sync(
                () => controller.pagingController.refresh(),
          ),
          child: PagedGridView(
            pagingController: controller.pagingController,
            builderDelegate: PagedChildBuilderDelegate<CategoryContent>(
              itemBuilder: (context, categoryItem, index) =>
                  CategoryItem(category: categoryItem),
              firstPageErrorIndicatorBuilder: (context) => ErrorIndicator(
                error: controller.pagingController.error,
                onTryAgain: () => controller.pagingController.refresh(),
              ),
              noItemsFoundIndicatorBuilder: (context) =>
                  EmptyListIndicator(),
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
          ),
        );
      },
    );
  }
}
