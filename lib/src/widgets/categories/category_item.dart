import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../models/stud_advice/category.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem({
    required this.category,
    super.key,
  });

  final CategoryContent category;
  final RxBool _isLongPress = false.obs;

  @override
  Widget build(BuildContext context) {
    Color cardColor = Color(int.parse(category.color, radix: 16) + 0xFF000000);

    return GestureDetector(
      onLongPress: () {
        _isLongPress.value = true;
      },
      onTap: () {
        _isLongPress.value = false;
      },
      child: Card(
        color: cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        category.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${category.administrativeProcesses!.length} démarches ',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
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
                      )
                    ],
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage('assets/images/common/raven_image.png'),
                        height: 110,
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Obx(() => Visibility(
                        visible: _isLongPress.value,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 8),
                            Container(
                              constraints: const BoxConstraints(
                                maxWidth: 330,
                              ),
                              child: Text(
                                category.description ?? '',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            ElevatedButton(
                              onPressed: () {},
                              child: const Text('Go'),
                            ),
                          ],
                        ),
                      )),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
