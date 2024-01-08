import 'package:flutter/material.dart';
import 'package:stud_advice/src/widgets/common/paints/curved_dottedline/curved_dottedline_paint.dart';


import 'package:flutter/material.dart';

class ShimmerCurvedDottedLineWidget extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final double strokeWidth;
  final bool isLeft;

  const ShimmerCurvedDottedLineWidget({
    super.key,
    this.width = 500.0,
    this.height = 250.0,
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