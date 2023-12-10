import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../../models/stud_advice/Categories.dart';

class Category extends StatelessWidget {

  const Category({required this.category, super.key});

  final CategoryContent category;

  @override
  Widget build(BuildContext context) {

    Color cardColor = Color(int.parse(category.color, radix: 16) + 0xFF000000);

    return Card(
      color: cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Row(
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
                  "35",
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
                  image: AssetImage(
                      'assets/images/common/raven_image.png'),
                  height: 110,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
