import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../repositories/stud_advice/stud_advice.dart';
import 'search_categories_paged_list_view.dart';

class SearchCategoriesListScreen extends StatefulWidget {
  @override
  _AdministrativeCategoryListScreenState createState() => _AdministrativeCategoryListScreenState();
}

class _AdministrativeCategoryListScreenState extends State<SearchCategoriesListScreen> {
  String query = "";

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SearchCategoriesPagedListView(
      repository: Get.find<StudAdviceRepository>(),
      query: query,
    ),
  );
}

