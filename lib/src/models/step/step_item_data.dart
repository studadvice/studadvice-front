import 'package:flutter/material.dart';

class StepItem {
  final int number;
  final String title;
  final bool isCompleted;
  final bool isCurrent;

  StepItem({
    required this.number,
    required this.title,
    this.isCompleted = false,
    this.isCurrent = false,
  });

  // Method to get the background color of the step based on its state
  Color get backgroundColor {
    if (isCurrent) {
      return Colors.orange; // Color for the current step
    } else if (isCompleted) {
      return Colors.blue; // Color for the completed step
    } else {
      return Colors.grey; // Color for the upcoming step
    }
  }
}