import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../repositories/stud_advice/stud_advice.dart';
import 'categories_list_view.dart';

class CategoriesList extends StatefulWidget {
  @override
  _AdministrativeCategoryListScreenState createState() => _AdministrativeCategoryListScreenState();
}

class _AdministrativeCategoryListScreenState extends State<CategoriesList> {

  @override
  Widget build(BuildContext context) => Scaffold(
        body: CategoriesListView(
          repository: Get.find<StudAdviceRepository>(),
        ),
      );
}
