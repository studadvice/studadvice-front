import 'package:flutter/material.dart';
import 'package:stud_advice/src/common/chore.dart';

class StepNumberPainter extends CustomPainter {
  final int stepNumber;
  final Color color;
  final double diameter;
  final bool isActivated;
  final double borderWidth;
  final Color textBorderColor;

  StepNumberPainter({
    required this.stepNumber,
    required this.color,
    required this.diameter,
    this.isActivated = false,
    this.borderWidth = 5.0,
    this.textBorderColor = Colors.black,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Color fillColor = isActivated ? color : AppColors.grey.withOpacity(0.5);
    Color borderColor = AppColors.grey;

    final borderPaint = Paint()
      ..color = borderColor
      ..strokeWidth = borderWidth
      ..style = PaintingStyle.stroke;

    final fillPaint = Paint()
      ..color = fillColor
      ..style = PaintingStyle.fill;

    final textStyle = TextStyle(
      fontSize: diameter * 0.5,
      fontWeight: FontWeight.bold,
      foreground: Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2
        ..color = isActivated ? textBorderColor : AppColors.white,
    );

    final textSpan = TextSpan(text: stepNumber.toString(), style: textStyle);
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );
    textPainter.layout();

    final textOffset = Offset(
      (diameter - textPainter.width) / 2,
      (diameter - textPainter.height) / 2,
    );

    canvas.drawCircle(Offset(diameter / 2, diameter / 2), diameter / 2, fillPaint);

    canvas.drawCircle(Offset(diameter / 2, diameter / 2), diameter / 2 - borderWidth / 2, borderPaint);

    textPainter.paint(canvas, textOffset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    final oldPainter = oldDelegate as StepNumberPainter;
    return stepNumber != oldPainter.stepNumber ||
        color != oldPainter.color ||
        diameter != oldPainter.diameter ||
        isActivated != oldPainter.isActivated ||
        borderWidth != oldPainter.borderWidth ||
        textBorderColor != oldPainter.textBorderColor;
  }
}
