import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/stud_advice.dart';

import '../../widgets/common/app_bar/custom_search_app_bar.dart';

class FavoriteAdministrativesProcessesScreen extends StatelessWidget {
  static const String navigatorId =
      '/favorites_administratives_processes_screen';

  final FavoriteAdministrativeProcessController
      favoriteAdministrativeProcessController =
      Get.find<FavoriteAdministrativeProcessController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomSearchAppBar(controller: favoriteAdministrativeProcessController,hintText: 'categories.search'.tr),
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
          child: const FavoriteAdministrativeProcessListView(),
        ),
      ),
    );
  }
}
