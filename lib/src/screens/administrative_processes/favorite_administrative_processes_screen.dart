import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/stud_advice.dart';

class FavoriteAdministrativesProcessesScreen extends StatelessWidget {
  static const String navigatorId =
      '/favorites_administratives_processes_screen';

  final FavoriteAdministrativeProcessController
      favoriteAdministrativeProcessController =
      Get.find<FavoriteAdministrativeProcessController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          backgroundColor: AppColors.white,
          appBar: CustomSearchAppBar(
              controller: favoriteAdministrativeProcessController,
              hintText: 'categories.search'.tr),
          body: const FavoriteAdministrativeProcessListView()),
    );
  }
}
