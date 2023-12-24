import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:stud_advice/src/controllers/deals/search_deals_controller.dart';
import 'package:stud_advice/src/models/stud_advice/deals.dart';
import 'package:stud_advice/src/widgets/deals/deal_item.dart';
import 'package:stud_advice/stud_advice.dart';

class DealsListView extends StatelessWidget {
  const DealsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchDealsController>(
      init: SearchDealsController(),
      builder: (controller) {
        return RefreshIndicator(
          onRefresh: () => Future.sync(
                () => controller.pagingController.refresh(),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text(
                  "Explore deals",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: PagedGridView(
                  pagingController: controller.pagingController,
                  builderDelegate: PagedChildBuilderDelegate<DealContent>(
                    itemBuilder: (context, dealItem, index) {
                      return DealItem(deal: dealItem,);
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
