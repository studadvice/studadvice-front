import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../repositories/stud_advice/stud_advice.dart';
import 'categories_paged_list_view.dart';

class CategoriesListScreen extends StatefulWidget {
  @override
  _AdministrativeCategoryListScreenState createState() => _AdministrativeCategoryListScreenState();
}

class _AdministrativeCategoryListScreenState extends State<CategoriesListScreen> {

  @override
  Widget build(BuildContext context) => Scaffold(
        body: CategoriesPagedListView(
          repository: Get.find<StudAdviceRepository>(),
        ),
      );
}
