import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/src/widgets/administrative_process/favorite_administrative_process_list_view.dart';
import 'package:stud_advice/stud_advice.dart';

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
      appBar: CustomAppBar(controller: favoriteAdministrativeProcessController),
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
