import 'package:flutter/material.dart';
import 'package:stud_advice/src/controllers/categories/controller.dart';

import '../search/custom_search_bar.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final CustomSearchController controller;

  CustomAppBar({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 150,
      elevation: 0,
      backgroundColor: Colors.transparent,
      iconTheme: const IconThemeData(color: Colors.grey, size: 28),
      flexibleSpace: Container(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        height: 190,
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.1, 0.5],
            colors: [
              Color(0xff886ff2),
              Color(0xff6849ef),
            ],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Align(
              alignment: Alignment.center,
              child: CustomSearchBar(controller: controller),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(150);
}
