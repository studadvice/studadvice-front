import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:stud_advice/src/screens/home/calendar.dart';
import 'package:stud_advice/stud_advice.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchCategoryController>(
      init: SearchCategoryController(),
      builder: (controller) {
        return RefreshIndicator(
          onRefresh: () => Future.sync(
                () => controller.pagingController.refresh(),
          ),
          color: AppColors.secondaryColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "categories.explore".tr,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                      children : [
                        IconButton(
                          icon: const Icon(Icons.calendar_month),
                          color: AppColors.primaryColor,
                          onPressed: () => Get.toNamed(
                            CalendarScreen.navigatorId,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.favorite),
                          color: AppColors.primaryColor,
                          onPressed: () => Get.toNamed(
                            FavoriteAdministrativesProcessesScreen.navigatorId,
                          ),
                        )
                      ]
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: PagedGridView(
                  pagingController: controller.pagingController,
                  builderDelegate: PagedChildBuilderDelegate<CategoryContent>(
                    itemBuilder: (context, categoryItem, index) {
                      return CategoryItem(category: categoryItem);
                    },
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
              ),
            ],
          ),
        );
      },
    );
  }
}
