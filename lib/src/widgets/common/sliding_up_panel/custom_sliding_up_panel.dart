import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:stud_advice/stud_advice.dart';

class CustomSlidingUpPanel extends StatelessWidget {
  final Widget bodyContent;
  final Widget slidingWidget;
  final String title;
  final PanelController panelController;

  CustomSlidingUpPanel({
    super.key,
    required this.bodyContent,
    required this.slidingWidget,
    required this.title,
    required this.panelController,
  });


  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      minHeight: 0.0,
      maxHeight: MediaQuery.of(context).size.height * 0.5,
      controller: panelController,
      parallaxEnabled: true,
      parallaxOffset: .2,
      renderPanelSheet: false,
      panel: _floatingPanel(context),
      collapsed: _floatingCollapsed(),
      borderRadius: const BorderRadius.all(Radius.circular(24.0)),
      body: Container(
        child: bodyContent,
      ),
    );
  }

  Widget _floatingCollapsed(){
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.black26,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0)),
      ),
      margin: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
      child: Center(
        child: Text(
          title,
        ),
      ),
    );
  }

  Widget _floatingPanel(BuildContext context) {
    Color roadmapBackgroundColor = Theme.of(context).brightness == Brightness.dark
        ? AppColors.roadmapBackgroundColorDark
        : AppColors.roadmapBackgroundColorLight;
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0)
      ),
      child: Container(
        decoration: BoxDecoration(
          color: roadmapBackgroundColor.withOpacity(0.95),
          boxShadow: [
            const BoxShadow(
              blurRadius: 10.0,
              color: AppColors.black26,
            ),
          ],
        ),
        child: Center(
          child: slidingWidget,
        ),
      ),
    );
  }

}
