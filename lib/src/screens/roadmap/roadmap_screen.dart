import 'package:flutter/material.dart';
import 'package:stud_advice/src/widgets/common/paints/curved_dottedline/curved_dottedline_paint.dart';
import 'package:stud_advice/src/widgets/common/paints/step_number/step_number_widget.dart';
import 'package:stud_advice/src/widgets/common/paints/steps_indicator_widget.dart';

class RoadMapScreen extends StatelessWidget {
  static const navigatorId = '/roadmap';


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: StepsIndicator(stepCount: 30),
    );
  }
}
