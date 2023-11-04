import 'package:flutter/cupertino.dart';
import 'package:stud_advice/common/colors/app_colors.dart';

class ConnectionButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final Color? borderColor;
  final Function()? onTap;

  const ConnectionButton({
    super.key,
    required this.text,
    required this.textColor,
    required this.backgroundColor,
    this.borderColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: AppColors.secondaryColor, width: 0.5),
        ),
        child: Center(
          child: Text(text,
              style: TextStyle(
                color: textColor,
                fontSize: 16,
              )),
        ),
      ),
    );
  }
}
