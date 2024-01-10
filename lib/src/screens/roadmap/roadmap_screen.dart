import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:stud_advice/stud_advice.dart';

class RoadMapScreen extends StatelessWidget {
  static const navigatorId = '/roadmap';
  final PanelController panelController = PanelController();
  final String administrativeProcessName;
  final RoadMapController roadMapController = Get.find<RoadMapController>();
  final StepController stepController = Get.find<StepController>();

  RoadMapScreen({
    super.key,
    required this.administrativeProcessName,
  });

  @override
  Widget build(BuildContext context) {
    // get the road map arguments
    final Map<String, dynamic> args = Get.arguments;
    final String administrativeProcessId =
        args['administrativeProcessId'] ?? '';
    final String administrativeProcessName =
        args['administrativeProcessName'] ?? '';
    final String administrativeProcessDescription =
        args['administrativeProcessDescription'] ?? '';
    final List<StepItem> steps = args['steps'] ?? [];
    final String categoryId = args['categoryId'];
    // set the steps
    stepController.setSteps(steps);

    return Scaffold(
        appBar: _buildAppBar(togglePanel),
        body: FutureBuilder(
          future: stepController.setAndAddMetadataToStep(
              steps, administrativeProcessId),
          builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: RoadMapShimmer());
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              stepController
                  .setProcessTitle(capitalize(administrativeProcessName));
              stepController
                  .setProcessDescription(administrativeProcessDescription);
              return Stack(children: [
                CustomSlidingUpPanel(
                  panelController: panelController,
                  bodyContent: GestureDetector(
                    onTap: () {
                      panelController.close();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: StepsIndicator(
                          currentStep: stepController.currentStep.value,
                          steps: stepController.steps,
                          administrativeProcessId: administrativeProcessId,
                          categoryId: categoryId),
                    ),
                  ),
                  title: stepController.getProcessTitle(),
                  slidingWidget: StepDetailCardWidget(
                    title: stepController.getProcessTitle(),
                    description: stepController.getProcessDescription(),
                    onNextPressed: () {},
                    onCompletePressed: () async {
                      await stepController.resetStepProgression(
                          administrativeProcessId, categoryId);
                      await stepController.setAndAddMetadataToStep(
                          stepController.steps, administrativeProcessId);
                      stepController.update();
                    },
                  ),
                ),
              ]);
            }
          },
        ));
  }

  PreferredSizeWidget _buildAppBar(VoidCallback onInfoPress) {
    return AppBar(
      title: Text(
        'roadmap.title'.tr,
        style: const TextStyle(
          fontSize: AppFontSizes.large18,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.of(Get.context!).pop();
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.info_outline),
          onPressed: onInfoPress,
        ),
      ],
      backgroundColor: Theme.of(Get.context!).scaffoldBackgroundColor,
      elevation: 0,
      automaticallyImplyLeading: false,
    );
  }

  void togglePanel() {
    if (panelController.isPanelOpen) {
      panelController.close();
    } else {
      panelController.open();
    }
  }

  String capitalize(String text) {
    if (text.isEmpty) {
      return text;
    } else {
      return text[0].toUpperCase() + text.substring(1);
    }
  }
}
