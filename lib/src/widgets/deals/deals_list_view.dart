import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/src/controllers/deals/search_deals_controller.dart';
import 'package:stud_advice/src/widgets/deals/deals_search_list_view.dart';
import '../../models/stud_advice/deals.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stud_advice/src/exceptions/no_result_indicator.dart';
import 'package:stud_advice/src/screens/deals/deals_search_screen.dart';
import 'package:stud_advice/src/widgets/deals/deal_item.dart';
import '../../../stud_advice.dart';
import '../../widgets/deals/deal_item_slide.dart';

class DealsListView extends StatelessWidget {
  final PageController _controller = PageController();
  final SearchDealsController searchDealsController = Get.find();

  DealsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
      return GetX<SearchDealsController>(
        builder: (controller) {
          if (controller.searchQuery.isEmpty) {
            return Scaffold(
              body: FutureBuilder<Deals>(
                future: searchDealsController.getDealsBySearch(size: 3, number: 0),
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
                                  return DealItemSlide(deal: deals.content[index]);
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
                                activeDotColor: AppColors.primaryColor,
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
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.to(() => DealsSearchScreen());
                                  },
                                  child: const Icon(
                                    Icons.add,
                                    color: AppColors.black,
                                    size: 35,
                                  ),
                                ),
                              ],
                            ),
                            FutureBuilder<Deals>(
                              future: searchDealsController.getRecommendedDeals(size: 4, number: 0),
                              builder: (context, recommendedSnapshot) {
                                if (recommendedSnapshot.connectionState ==
                                    ConnectionState.done) {
                                  if (recommendedSnapshot.hasData) {
                                    final recommendedDeals =
                                    recommendedSnapshot.data!;
                                    return Expanded(
                                      child: GridView.builder(
                                        shrinkWrap: true,
                                        physics: const AlwaysScrollableScrollPhysics(),
                                        gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 10,
                                          mainAxisSpacing: 10,
                                        ),
                                        itemCount: recommendedDeals.numberOfElements,
                                        itemBuilder: (context, index) {
                                          return DealItem(
                                            deal: recommendedDeals.content[index],
                                          );
                                        },
                                      ),
                                    );
                                  } else {
                                    return NoResultIndicator();
                                  }
                                } else {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      );
                    } else {
                      return NoResultIndicator();
                    }
                  } else if (snapshot.hasError) {
                    return Text('image_error'.tr);
                  }
                  else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            );
          }
          return const DealsSearchListView();
      },
   );
  }
}
