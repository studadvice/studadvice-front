import 'package:flutter/material.dart';
import 'package:stud_advice/stud_advice.dart';

class CurvedDottedLineWidget extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final double strokeWidth;
  final bool isLeft;

  const CurvedDottedLineWidget({
    super.key,
    required this.width,
    required this.height,
    required this.color,
    this.strokeWidth = 2.0,
    required this.isLeft,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CurvedDottedLinePainter(
        color: color,
        strokeWidth: strokeWidth,
        isLeft: isLeft,
      ),
      size: Size(width, height),
    );
  }
}