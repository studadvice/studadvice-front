import 'package:flutter/material.dart';
import 'package:stud_advice/src/controllers/search/custom_search_controller.dart';

import '../search/custom_search_bar.dart';

class CustomSearchAppBar extends StatelessWidget implements PreferredSizeWidget {
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
      title: const Text(
        "Stud'Advice",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),
      ),
      flexibleSpace: Container(
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
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
                padding: const EdgeInsets.all(10),
                child: CustomSearchBar(controller: controller, hintText: hintText),
            )
          ],
        ),
      )
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(110);
}
