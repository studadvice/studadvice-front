import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/stud_advice.dart';
import 'package:url_launcher/url_launcher.dart';

class DealDetailScreen extends StatelessWidget {
  static const navigatorId = '/deal_detail_screen';
  final FileController fileController = Get.find();

  @override
  Widget build(BuildContext context) {
    final deal = Get.arguments['deal'] as DealContent;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(
          deal.title,
          style: const TextStyle(
            color: AppColors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () => Get.back(),
        ),
        backgroundColor: AppColors.primaryColor,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: <Widget>[
            SizedBox(
              height: size.height * 0.55,
              child: FutureBuilder<String?>(
                future: fileController.downloadFile(deal.imageId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.data != null) {
                    return Image.file(
                      File(snapshot.data!),
                      height: size.height * 0.55,
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
            Positioned.fill(
              top: size.height * 0.55 - 20,
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  color: AppColors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: ListView(
                  children: <Widget>[
                    Text(
                      deal.title,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        const Icon(
                          Icons.star,
                          color: AppColors.yellow,
                          size: 20,
                        ),
                        Text(
                          deal.rating.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      'deals.description'.tr,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(deal.description),
                    if (deal.startDate != null) ...[
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        'deals.start'.tr,
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(deal.startDate!),
                    ],
                    if (deal.endDate != null) ...[
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        'deals.end'.tr,
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(deal.endDate!),
                    ],
                    const SizedBox(height: 16),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          foregroundColor: Colors.white,
                          textStyle: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 24.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onPressed: () async {
                          Uri uri = Uri.parse(deal.url);
                          bool isLaunchPossible = await canLaunchUrl(uri);
                          debugPrint('uri: $uri');
                          debugPrint('isLaunchPossible: $isLaunchPossible');
                          if (isLaunchPossible) {
                            await launchUrl(Uri.parse(deal.url),
                                mode: LaunchMode.inAppWebView);
                          } else {
                            throw 'Could not launch $deal.url';
                          }
                        },
                        child: Text('deals.url'.tr),
                      ),
                    ),
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
