import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:stud_advice/stud_advice.dart';

class FaqListView extends StatelessWidget {
  const FaqListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchFaqController>(
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "faq.title".tr,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "faq.explore".tr,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: PagedListView(
                  pagingController: controller.pagingController,
                  builderDelegate: PagedChildBuilderDelegate<FaqContent>(
                    itemBuilder: (context, faqItem, index) {
                      return FaqItem(faqItem: faqItem);
                    },
                    firstPageErrorIndicatorBuilder: (context) => ErrorIndicator(
                      error: controller.pagingController.error,
                      onTryAgain: () => controller.pagingController.refresh(),
                    ),
                    noItemsFoundIndicatorBuilder: (context) =>
                        EmptyListIndicator(),
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
