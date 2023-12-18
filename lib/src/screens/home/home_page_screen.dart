import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/stud_advice.dart';
import '../../controllers/search/CustomSearchController.dart';
import '../../widgets/common/search/custom_search_bar.dart';

class HomePageScreen extends StatelessWidget {
  static const navigatorId = '/home_page_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150,
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.grey, size: 28),
        flexibleSpace: Container(
          padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
          height: 200,
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
                height: 50,
              ),
              CustomSearchBar(),
            ],
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: GetBuilder<CustomSearchController>(
            builder: (controller) => SearchContent(
              showSearchCategories: controller.showSearchCategories.value,
              searchQuery: controller.searchController.text,
            ),
          ),
        ),
      ),
    );
  }
}


class SearchContent extends StatelessWidget {
  final bool showSearchCategories;
  final String searchQuery;

  const SearchContent({
    required this.showSearchCategories,
    required this.searchQuery,
  });

  @override
  Widget build(BuildContext context) {
    return showSearchCategories
        ? SearchCategoriesListView(query: searchQuery)
        : const CategoriesListView();
  }
}
