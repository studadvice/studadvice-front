import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:stud_advice/stud_advice.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem({
    required this.category,
    super.key,
  });

  final CategoryContent category;
  final FileController fileController = Get.find();
  final SearchCategoryController searchCategoryController =
      Get.find<SearchCategoryController>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        String categoryId = category.id;

        return GestureDetector(
          onTap: () {
            Get.toNamed(
              AdministrativesProcessesScreen.navigatorId,
              arguments: {
                'categoryId': categoryId,
                'categoryColor': Color(
                    int.parse(category.color.substring(1), radix: 16) +
                        0xFF000000),
                "categoryName": category.name,
              },
            );
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(int.parse(category.color.substring(1), radix: 16) +
                  0xFF000000),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.1),
                  blurRadius: 4.0,
                  spreadRadius: .05,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    category.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    '${category.administrativeProcesses!.length} ${'categories.process'.tr}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      FutureBuilder<double>(
                        future:
                            searchCategoryController.getProgressValue(category),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            double progress = snapshot.data ?? 0.0;

                            return CircularPercentIndicator(
                              radius: 30,
                              lineWidth: 8,
                              animation: true,
                              animationDuration: 1500,
                              circularStrokeCap: CircularStrokeCap.round,
                              percent: progress,
                              progressColor: Colors.white,
                              center: Text(
                                "${(progress * 100).toInt()}%",
                                style: const TextStyle(color: Colors.white),
                              ),
                            );
                          } else {
                            return const CircularProgressIndicator();
                          }
                        },
                      ),
                      const SizedBox(width: 40.0),
                      RotationTransition(
                        turns: const AlwaysStoppedAnimation(0 / 360),
                        child: FutureBuilder<String?>(
                          future: fileController.downloadFile(category.imageId),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                    ConnectionState.done &&
                                snapshot.data != null) {
                              return Container(
                                width: constraints.maxWidth / 4,
                                height: constraints.maxHeight / 4,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: FileImage(File(snapshot.data!)),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4),
                                    bottomLeft: Radius.circular(4),
                                  ),
                                ),
                              );
                            } else if (snapshot.hasError) {
                              return const Icon(
                                Icons.error_outline_sharp,
                              );
                            } else {
                              return const Icon(Icons.image);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
