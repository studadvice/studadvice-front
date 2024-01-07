import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:stud_advice/stud_advice.dart';

class FavoriteAdministrativeProcessListView extends StatelessWidget {
  const FavoriteAdministrativeProcessListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoriteAdministrativeProcessController>(
      init: FavoriteAdministrativeProcessController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            forceMaterialTransparency: true,
            title: Text(
              'favorite_administrative_processes.title'.tr,
              style: const TextStyle(
                fontSize: AppFontSizes.large20,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            titleTextStyle: const TextStyle(
              fontSize: AppFontSizes.large20,
              fontWeight: FontWeight.bold,
            ),
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
                itemBuilder: (context, process, index) =>
                    FavoriteAdministrativeProcessListTile(
                      name: process.name,
                      imageId: process.imageId,
                      description: process.description,
                      administrativeProcessId: process.id,
                      type: process.type ?? "",
                      showProgressBar: false,
                ),
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
