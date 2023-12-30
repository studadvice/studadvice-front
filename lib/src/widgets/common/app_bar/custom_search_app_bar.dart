import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/src/controllers/search/custom_search_controller.dart';
import 'package:stud_advice/stud_advice.dart';

class CustomSearchAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final CustomSearchController controller;
  final String hintText;

  CustomSearchAppBar({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      automaticallyImplyLeading: false,
      flexibleSpace: Container(
        height: MediaQuery.of(context).size.height / 6,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          color: AppColors.primaryColor,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (Get.currentRoute ==
                      AdministrativesProcessesScreen.navigatorId ||
                  Get.currentRoute ==
                      FavoriteAdministrativesProcessesScreen.navigatorId)
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  color: AppColors.white,
                  onPressed: () => Get.back(),
                ),
              if (Get.currentRoute ==
                      AdministrativesProcessesScreen.navigatorId ||
                  Get.currentRoute ==
                      FavoriteAdministrativesProcessesScreen.navigatorId)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: CustomSearchBar(
                      controller: controller,
                      hintText: hintText,
                    ),
                  ),
                ),
              if (!(Get.currentRoute ==
                      AdministrativesProcessesScreen.navigatorId ||
                  Get.currentRoute ==
                      FavoriteAdministrativesProcessesScreen.navigatorId))
                Expanded(
                  child: Center(
                    child: CustomSearchBar(
                      controller: controller,
                      hintText: hintText,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(110);
}
