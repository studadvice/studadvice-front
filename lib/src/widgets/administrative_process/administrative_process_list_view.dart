import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:stud_advice/stud_advice.dart';

class AdministrativeProcessListView extends StatelessWidget {
  final String categoryId;
  final String categoryName;
  final Color categoryColor;

  const AdministrativeProcessListView({
    super.key,
    required this.categoryName,
    required this.categoryId,
    required this.categoryColor,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdministrativeProcessController>(
      init: AdministrativeProcessController(),
      builder: (controller) {
        controller.categoryId = categoryId;
        Color backgroundColor = categoryColor;

        return Scaffold(
          appBar: AppBar(
            forceMaterialTransparency: true,
            title: Text(categoryName,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            centerTitle: true,
            toolbarHeight: 50,
            backgroundColor: AppColors.white,
            automaticallyImplyLeading: false,
          ),
          body: RefreshIndicator(
            onRefresh: () => Future.sync(
              () => controller.pagingController.refresh(),
            ),
            color: AppColors.secondaryColor,
            child: PagedListView.separated(
              pagingController: controller.pagingController,
              builderDelegate:
                  PagedChildBuilderDelegate<AdministrativeProcessContent>(
                itemBuilder: (context, process, index) {
                  return AdministrativeProcessListTile(
                    categoryId: categoryId,
                    name: process.name,
                    imageId: process.imageId,
                    description: process.description,
                    administrativeProcessId: process.id,
                    steps: process.steps!,
                    backgroundColor: backgroundColor,
                    type: process.type ?? "",
                  );
                },
                firstPageErrorIndicatorBuilder: (context) => ErrorIndicator(
                  error: controller.pagingController.error,
                  onTryAgain: () => controller.pagingController.refresh(),
                ),
                noItemsFoundIndicatorBuilder: (context) => EmptyListIndicator(),
              ),
              padding: const EdgeInsets.all(16),
              separatorBuilder: (context, index) => const SizedBox(
                height: 16,
              ),
            ),
          ),
        );
      },
    );
  }
}
