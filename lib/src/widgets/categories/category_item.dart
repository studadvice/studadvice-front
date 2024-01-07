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

  @override
  Widget build(BuildContext context) {
    Color cardColor =
        Color(int.parse(category.color.substring(1), radix: 16) + 0xFF000000);

    return LayoutBuilder(
        builder: (context, constraints) =>
        GestureDetector(
      onTap: () {
        Get.toNamed(
          AdministrativesProcessesScreen.navigatorId,
          arguments: {
            'categoryId': category.id,
            'categoryColor': cardColor,
            "categoryName": category.name,
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 4.0,
              spreadRadius: .05,
            ),
          ],
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                  ))),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircularPercentIndicator(
                  radius: 30,
                  lineWidth: 8,
                  animation: true,
                  animationDuration: 1500,
                  circularStrokeCap: CircularStrokeCap.round,
                  percent: 0.7,
                  progressColor: Colors.white,
                  center: const Text(
                    "${70}%",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 40.0),
                RotationTransition(
                  turns: const AlwaysStoppedAnimation(0 / 360),
                  child: FutureBuilder<String?>(
                    future: fileController.downloadFile(category.imageId),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done &&
                          snapshot.data != null) {
                        return Container(
                          width: constraints.maxWidth /4,
                          height: constraints.maxHeight /4,
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
                          size: 50.0,
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
        ]),
      ),
    )
    );
  }
}
