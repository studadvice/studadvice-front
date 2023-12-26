import 'package:flutter/material.dart';
import 'package:stud_advice/src/common/chore.dart';
import 'package:stud_advice/src/controllers/administrative_processes/search_administrative_processes_controller.dart';

class CustomRoadmapAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onBackPress;
  final VoidCallback onInfoPress;

  const CustomRoadmapAppBar({
    super.key,
    required this.title,
    required this.onBackPress,
    required this.onInfoPress,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
          color: AppColors.black,
        ),
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: AppColors.black),
        onPressed: onBackPress,
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.info_outline, color: AppColors.black),
          onPressed: onInfoPress,
        ),
      ],
      backgroundColor: AppColors.white,
      elevation: 4,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
