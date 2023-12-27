import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/src/widgets/administrative_process/administrative_process_list_view.dart';
import '../../../stud_advice.dart';
import '../../widgets/common/app_bar/custom_search_app_bar.dart';

class AdministrativesProcessesScreen extends StatelessWidget {
  static const String navigatorId = '/administratives_processes_screen';

  final Map<String, dynamic> args = Get.arguments;

  final SearchAdministrativeProcessController searchAdministrativeProcessController =
  Get.find<SearchAdministrativeProcessController>();

  String _getCategoryId() {
    return args['categoryId'] ?? '';
  }

  String _getCategoryColor() {
    return args['categoryColor'] ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      // TODO add a navigation rail to see the favorites for the current category
      appBar: CustomSearchAppBar(controller: searchAdministrativeProcessController,hintText: 'search'.tr),
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
            categoryColor: _getCategoryColor(),
          ),
        ),
      ),
    );
  }
}
