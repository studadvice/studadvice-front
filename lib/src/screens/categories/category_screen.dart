import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:stud_advice/src/models/stud_advice/category.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({required this.category, super.key});

  final CategoryContent category;

  @override
  Widget build(BuildContext context) {
    bool isLongPress = false;
    Color cardColor = Color(int.parse(category.color, radix: 16) + 0xFF000000);

    return GestureDetector(
      onLongPress: () {
        // Handle long press
      },
      onTap: () {
        // Handle tap
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
                      const Text(
                        "35",
                        style: TextStyle(
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
                      Visibility(
                        visible: isLongPress,
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
                      )
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