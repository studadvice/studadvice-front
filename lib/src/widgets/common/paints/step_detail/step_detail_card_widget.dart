import 'package:flutter/material.dart';
import 'package:stud_advice/src/common/chore/app_colors.dart';
import 'package:stud_advice/src/widgets/common/buttons/custom_button.dart';

class StepDetailCardWidget extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback? onActionPressed;
  final String actionText;

  StepDetailCardWidget({
    super.key,
    required this.title,
    required this.description,
    this.onActionPressed,
    this.actionText = 'Action',
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.all(4.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColorAccent,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              description,
              style: const TextStyle(
                fontSize: 16.0,
                color: AppColors.black26,
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
