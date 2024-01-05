import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:stud_advice/src/controllers/roadmap/step_controller.dart';
import 'package:stud_advice/stud_advice.dart';
import '../../widgets/common/paints/steps_indicator_widget.dart';

class RoadMapScreen extends StatelessWidget {
  static const navigatorId = '/roadmap';
  final PanelController panelController = PanelController();
  final StepController stepController = Get.find();
  final Map<String, dynamic> args = Get.arguments;

  String _getAdministrativeId() {
    return args['administrativeProcessId'] ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'roadmap.title'.tr,
          style: const TextStyle(
            fontSize: AppFontSizes.large18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder<AdministrativeProcessContent>(
        future: stepController.getAdministrativeProcessById(
          id: _getAdministrativeId(),
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  color: AppColors.secondaryColor,
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No data available'));
          } else {
            stepController.steps.assignAll(snapshot.data?.steps as Iterable<StepProcess>);
            return
                Container(
                      margin: const EdgeInsets.all(10),
                      child: StepsIndicator(
                        currentStep: stepController.currentStep.value,
                        steps: stepController.steps,
                      ),
                );
          }
        },
      ),
    );
  }
}
