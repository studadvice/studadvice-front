import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/stud_advice.dart';

class DealItem extends StatelessWidget {
  final DealContent deal;
  final FileController fileController = Get.find();

  DealItem({
    super.key,
    required this.deal,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          DealDetailScreen.navigatorId,
          arguments: {'deal': deal},
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Stack(
          children: [
            Positioned.fill(
              child: FutureBuilder<String?>(
                future: fileController.downloadFile(deal.imageId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.data != null) {
                    return Image.file(
                      File(snapshot.data!),
                      height: MediaQuery.of(context).size.height / 2.5,
                    );
                  } else if (snapshot.hasError) {
                    return const Center(child: Icon(Icons.image));
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
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.height / 14,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  ),
                ),
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            deal.title,
                            style: const TextStyle(
                              color: Colors.white,
                              overflow: TextOverflow.ellipsis,
                              fontSize: AppFontSizes.large16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        if (deal.endDate != null)
                          const Icon(
                            Icons.timer,
                            color: Colors.white,
                            size: 20.0,
                          ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: AppColors.yellow,
                          size: 20,
                        ),
                        Text(
                          deal.rating.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: AppFontSizes.small,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
