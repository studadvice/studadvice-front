import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:stud_advice/src/widgets/administrative_process/administrative_process_tile.dart';
import 'package:stud_advice/stud_advice.dart';

class AdministrativeProcessListView extends StatelessWidget {
  final String categoryId;
  final String categoryColor;

  const AdministrativeProcessListView({
    super.key,
    required this.categoryId,
    required this.categoryColor,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdministrativeProcessController>(
      init: AdministrativeProcessController(),
      builder: (controller) {
        return RefreshIndicator(
          onRefresh: () =>
              Future.sync(
                    () => controller.pagingController.refresh(),
              ),
          child: PagedListView.separated(
            pagingController: controller.pagingController,
            builderDelegate: PagedChildBuilderDelegate<AdministrativeProcess>(
              itemBuilder: (context, process, index) =>
                  AdministrativeProcessListTile(
                    name: process.name,
                    imageFileSrc: process.imageId,
                    description: process.description,
                    administrativeProcessId: process.id,
                    showProgressBar: false,
                    isFavorite: process
                        .isFavorite!, // TODO set this to true when the user when the progress bar is needed.
                  ),
              firstPageErrorIndicatorBuilder: (context) =>
                  ErrorIndicator(
                    error: controller.pagingController.error,
                    onTryAgain: () => controller.pagingController.refresh(),
                  ),
              noItemsFoundIndicatorBuilder: (context) => EmptyListIndicator(),
            ),
            padding: const EdgeInsets.all(16),
            separatorBuilder: (context, index) =>
            const SizedBox(
              height: 16,
            ),
          ),
        );
      },
    );
  }
}

