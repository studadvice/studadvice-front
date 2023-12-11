import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../repositories/stud_advice/stud_advice.dart';
import 'search_categories_paged_list_view.dart';

class SearchCategoriesListScreen extends StatefulWidget {
  final String searchQuery;

  SearchCategoriesListScreen({required this.searchQuery, super.key});

  @override
  SearchCategoriesListScreenState createState() => SearchCategoriesListScreenState();
}

class SearchCategoriesListScreenState extends State<SearchCategoriesListScreen> {

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SearchCategoriesPagedListView(
      repository: Get.find<StudAdviceRepository>(),
      query: widget.searchQuery,
    ),
  );
}

