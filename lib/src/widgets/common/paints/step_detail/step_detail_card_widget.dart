import 'package:flutter/material.dart';
import 'package:stud_advice/stud_advice.dart';

class StepDetailCardWidget extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback? onCompletePressed;
  final VoidCallback? onNextPressed;
  final String actionText;
  final Color? cardColor;
  final double? cardRadius;

  StepDetailCardWidget({
    super.key,
    required this.title,
    required this.description,
    this.actionText = 'Action',
    this.cardColor,
    this.cardRadius,
    this.onCompletePressed,
    this.onNextPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildDragHandler(),
            Text(
              title,
              style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 18.0),
            Text(
              description,
              style: const TextStyle(
                fontSize: 16.0,
                color: AppColors.black,
              ),
            ),
            const Spacer()],

      ),
    );
  }

  Widget buildDragHandler() {
    return Container(
      height: 5.0,
      width: 40.0,
      margin: const EdgeInsets.only(bottom: 15.0),
      decoration: const BoxDecoration(
        color: AppColors.black26,
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
      ),
    );
  }
}
