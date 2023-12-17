import 'package:flutter/material.dart';

class StepNumberPainter extends CustomPainter {
  final int stepNumber;
  final Color color;
  final double diameter;
  final bool isActivated;
  final double borderWidth;
  final Color textBorderColor;
  final bool isEnabled;

  StepNumberPainter({
    required this.stepNumber,
    required this.color,
    required this.diameter,
    this.isActivated = false,
    this.borderWidth = 3.0,
    this.textBorderColor = Colors.black,
    this.isEnabled = true,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Color fillColor = isActivated ? color : Colors.transparent;
    Color borderColor = isActivated ? Colors.blueGrey : color;

    if (!isEnabled) {
      fillColor = Colors.grey;
      borderColor = Colors.grey;
    }

    final borderPaint = Paint()
      ..color = borderColor
      ..strokeWidth = borderWidth;

    final fillPaint = Paint()
      ..color = fillColor
      ..style = PaintingStyle.fill;

    final textStyle = TextStyle(
      fontSize: diameter * 0.7,
      fontWeight: FontWeight.bold,
      foreground: Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2
        ..color = textBorderColor,
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

    if (isActivated) {
      canvas.drawCircle(Offset(diameter / 2, diameter / 2), diameter / 2, fillPaint);
    }

    canvas.drawCircle(Offset(diameter / 2, diameter / 2), diameter / 2 - borderWidth / 2, borderPaint);

    textPainter.paint(canvas, textOffset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
