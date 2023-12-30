import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/stud_advice.dart';

class AdministrativesProcessesScreen extends StatelessWidget {
  static const String navigatorId = '/administratives_processes_screen';

  final Map<String, dynamic> args = Get.arguments;

  final AdministrativeProcessController administrativeProcessController =
      Get.find<AdministrativeProcessController>();

  String _getCategoryId() {
    return args['categoryId'] ?? '';
  }

  String _getCategoryName() {
    return args['categoryName'] ?? '';
  }

  String _getCategoryColor() {
    return args['categoryColor'] ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomSearchAppBar(
          controller: administrativeProcessController,
          hintText: 'categories.search'.tr),
      body: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.grey50,
            boxShadow: [
              BoxShadow(
                color: AppColors.black26,
                offset: Offset(0, -2),
                blurRadius: 4.0,
              ),
            ],
          ),
          padding: const EdgeInsets.all(5.0),
          child: AdministrativeProcessListView(
            categoryId: _getCategoryId(),
            categoryName: _getCategoryName(),
            categoryColor: _getCategoryColor(),
          ),
        ),
      ),
    );
  }
}
