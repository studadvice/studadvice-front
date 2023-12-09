import 'package:flutter/material.dart';

class StepItem {
  final int number;
  final String title;
  final bool isCompleted;
  final bool isCurrent;
  final Color color;

  StepItem({
    required this.number,
    required this.title,
    this.isCompleted = false,
    this.isCurrent = false,
    required this.color,
  });
}