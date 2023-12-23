import 'package:flutter/material.dart';

class StepItem {
  final int number;
  final String title;
  bool isCompleted;
  final bool isCurrent;
  final Color color;
  final String description;

  StepItem({
    required this.number,
    required this.title,
    this.isCompleted = false,
    this.isCurrent = false,
    required this.color,
    required this.description,
  });
}