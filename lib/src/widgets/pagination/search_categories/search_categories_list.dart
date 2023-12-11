import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../repositories/stud_advice/stud_advice.dart';
import 'search_categories_list_view.dart';

class SearchCategoriesList extends StatefulWidget {
  final String searchQuery;

  SearchCategoriesList({required this.searchQuery, super.key});

  @override
  SearchCategoriesListState createState() => SearchCategoriesListState();
}

class SearchCategoriesListState extends State<SearchCategoriesList> {

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SearchCategoriesListView(
      repository: Get.find<StudAdviceRepository>(),
      query: widget.searchQuery,
    ),
  );
}

