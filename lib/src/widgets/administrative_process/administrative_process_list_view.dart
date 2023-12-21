import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:stud_advice/src/widgets/administrative_process/administrative_process_tile.dart';
import 'package:stud_advice/stud_advice.dart';

import '../../models/stud_advice/administrative_process.dart';

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
    return GetBuilder<SearchAdministrativeProcessController>(
      init: SearchAdministrativeProcessController(),
      builder: (controller) {
        return RefreshIndicator(
          onRefresh: () =>
              Future.sync(
                    () => controller.pagingController.refresh(),
              ),
          child: PagedListView.separated(
            pagingController: controller.pagingController,
            builderDelegate: PagedChildBuilderDelegate<AdministrativeProcessContent>(
              itemBuilder: (context, process, index) =>
                  AdministrativeProcessListTile(
                    name: process.name,
                    imageFileSrc: process.imageId,
                    description: process.description,
                    administrativeProcessId: process.id,
                    showProgressBar: false,
                    isFavorite: false, // TODO set this to true when the user when the progress bar is needed. //fixed this to false temporally because not handled now
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

