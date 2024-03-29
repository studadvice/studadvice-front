import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stud_advice/stud_advice.dart';

class DealsListView extends StatelessWidget {
  final PageController _controller = PageController();
  final DealsController dealsController = Get.find();

  DealsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetX<DealsController>(
      init: DealsController(),
      builder: (controller) {
        if (controller.searchQuery.isEmpty) {
          return Scaffold(
            body: SingleChildScrollView(
              child: FutureBuilder<Deals>(
                future: dealsController.getDealsBySearch(size: 3, number: 0),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData && snapshot.data!.content.isNotEmpty) {
                      final deals = snapshot.data!;
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 4,
                              child: PageView.builder(
                                controller: _controller,
                                itemCount: deals.numberOfElements,
                                itemBuilder: (context, index) {
                                  return DealItemSlide(
                                      deal: deals.content[index]);
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SmoothPageIndicator(
                              controller: _controller,
                              count: deals.content.length,
                              effect: const ExpandingDotsEffect(
                                activeDotColor: AppColors.secondaryColor,
                                dotColor: AppColors.grey,
                                dotHeight: 10,
                                dotWidth: 10,
                                spacing: 10,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'deals.recommendation'.tr,
                                  style: const TextStyle(
                                    fontSize: AppFontSizes.large20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed(
                                      DealsSearchScreen.navigatorId,
                                    );
                                    },
                                    child: Text(
                                      'deals.see_more'.tr,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: AppColors.secondaryColor,
                                      ),
                                    ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            FutureBuilder<Deals>(
                              future: dealsController.getRecommendedDeals(
                                  size: 4, number: 0),
                              builder: (context, recommendedSnapshot) {
                                if (recommendedSnapshot.connectionState ==
                                    ConnectionState.done) {
                                  if (recommendedSnapshot.hasData) {
                                    final recommendedDeals =
                                    recommendedSnapshot.data!;
                                    return GridView.builder(
                                      physics: const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10,
                                      ),
                                      itemCount:
                                      recommendedDeals.numberOfElements,
                                      itemBuilder: (context, index) {
                                        return DealItem(
                                          deal: recommendedDeals.content[index],
                                        );
                                      },
                                    );
                                  } else {
                                    return EmptyListIndicator();
                                  }
                                } else {
                                  return const Center(
                                    child: SizedBox(
                                      width: 24,
                                      height: 24,
                                      child: CircularProgressIndicator(
                                        color: AppColors.secondaryColor,
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      );
                    } else {
                      return EmptyListIndicator();
                    }
                  } else if (snapshot.hasError) {
                    return const Icon(Icons.image);
                  } else {
                    return const Center(
                      child: SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          color: AppColors.secondaryColor,
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          );
        }
        return RefreshIndicator(
          onRefresh: () => Future.sync(
                () => controller.pagingController.refresh(),
          ),
          color: AppColors.primaryColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  "deals.explore".tr,
                  style: const TextStyle(
                    fontSize: AppFontSizes.large20,
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
                      return DealItem(
                        deal: dealItem,
                      );
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
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
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
