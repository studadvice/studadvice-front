import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../../models/stud_advice/AdministrativeProcessCategory.dart';

class AdministrativeCategoryItem extends StatelessWidget {

  const AdministrativeCategoryItem({required this.category, super.key});

  final CategoryContent category;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orange,
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
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 4),
                const Text(
                  "35",
                  style: TextStyle(color: Colors.white),
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
