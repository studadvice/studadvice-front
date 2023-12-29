import 'package:flutter/material.dart';
import 'package:stud_advice/src/common/chore.dart';
import 'package:stud_advice/src/controllers/search/custom_search_controller.dart';

import '../search/custom_search_bar.dart';

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
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: AppColors.primaryColor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child:
                    CustomSearchBar(controller: controller, hintText: hintText),
              )
            ],
          ),
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(110);
}
