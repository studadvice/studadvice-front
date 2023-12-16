import 'package:flutter/material.dart';

import 'search_categories_list_view.dart';

class SearchCategories extends SearchDelegate<String> {

  @override
  String get searchFieldLabel => "Rechercher des démarches";

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context,"");
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Scaffold(
        body: Center(
          child: SearchCategoriesListView(query: query),
        )
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
    );
  }
}
