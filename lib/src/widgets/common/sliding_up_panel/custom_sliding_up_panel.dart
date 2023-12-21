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
      renderPanelSheet: false,
      panel: _floatingPanel(),
      collapsed: _floatingCollapsed(),
      body: bodyContent,
    );
  }


  Widget _floatingCollapsed(){
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.primaryColorAccent,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0)),
      ),
      margin: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _floatingPanel(){
    return Container(
      decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(Radius.circular(24.0)),
          boxShadow: [
            BoxShadow(
              blurRadius: 20.0,
              color: Colors.grey,
            ),
          ]
      ),
      margin: const EdgeInsets.all(24.0),
      child: Center(
        child: Center(child: slidingWidget),
      ),
    );
  }
}
