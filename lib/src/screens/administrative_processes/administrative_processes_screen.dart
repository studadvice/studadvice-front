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

  Color _getCategoryColor() {
    return args['categoryColor'] ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          backgroundColor: AppColors.white,
          appBar: CustomSearchAppBar(
              controller: administrativeProcessController,
              hintText: 'categories.search'.tr),
          body: AdministrativeProcessListView(
            categoryId: _getCategoryId(),
            categoryName: _getCategoryName(),
            categoryColor: _getCategoryColor(),
          )),
    );
  }
}
