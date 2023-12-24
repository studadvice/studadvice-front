import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stud_advice/src/common/chore.dart';
import 'package:stud_advice/src/widgets/deals/deal_item.dart';
import 'package:get/get.dart';

import '../../controllers/deals/search_deals_controller.dart';
import '../../models/stud_advice/deals.dart';
import '../../widgets/common/app_bar/custom_app_bar.dart';

class DealsScreen extends StatelessWidget {
  static const navigatorId = '/deals_screen';
  final PageController _controller = PageController();
  final SearchDealsController searchDealsController = Get.find();

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height / 4);
    return Scaffold(
      appBar: CustomAppBar(controller: searchDealsController),
      body: FutureBuilder<Deals>(
        future: searchDealsController.getDealsBySearch(size: 5, number: 0),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
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
                          return DealItem(deal: deals.content[index]);
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
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            "Recommended",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            )

                        ),
                        Icon(
                          Icons.more_horiz,
                          color: AppColors.black,
                          size: 35,
                        )
                      ],
                    )
                  ],
                ),
              );
            } else {
              return const Center(
                child: Text('Aucun deal trouvé.'),
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
