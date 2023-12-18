import 'package:flutter/material.dart';
import 'package:stud_advice/src/common/chore/app_colors.dart';
import 'package:stud_advice/src/widgets/common/buttons/custom_button.dart';

class StepDetailCardWidget extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback? onActionPressed;
  final String actionText;
  final Color? cardColor;
  final double? cardRadius;

  StepDetailCardWidget({
    super.key,
    required this.title,
    required this.description,
    this.onActionPressed,
    this.actionText = 'Action',
    this.cardColor,
    this.cardRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(4.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(cardRadius ?? 40.0)),
      ),
      color: cardColor ?? AppColors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColorAccent,
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
            const Spacer(),
            if (onActionPressed != null)
              Center(
                  child: CustomButton(
                      text: actionText,
                      textColor: AppColors.white,
                      backgroundColor: AppColors.primaryColorAccent,
                      onPressed: onActionPressed!
                  )
                ),
          ],
        ),
      ),
    );
  }
}
