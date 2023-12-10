import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/src/widgets/pagination/list/paged_list_view.dart';
import '../../../repositories/stud_advice/stud_advice.dart';
import '../preferences/list_preferences.dart';

class CategoriesListScreen extends StatefulWidget {
  @override
  _CategoriesListScreenState createState() => _CategoriesListScreenState();
}

class _CategoriesListScreenState extends State<CategoriesListScreen> {
  ListPreferences? _listPreferences;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
        //   actions: [
        //     IconButton(
        //       icon: const Icon(Icons.tune),
        //       onPressed: () {
        //         _pushListPreferencesScreen(context);
        //       },
        //     )
        //   ],
        // ),
        ),
        body: PagedArticleListView(
          repository: Get.find<StudAdviceRepository>(),
          listPreferences: _listPreferences,
        ),
      );
  //
  // Future<void> _pushListPreferencesScreen(BuildContext context) async {
  //   final route = MaterialPageRoute<ListPreferences>(
  //     builder: (_) => ListPreferencesScreen(
  //       repository: Provider.of<StudAdviceRepository>(context),
  //       preferences: _listPreferences,
  //     ),
  //     fullscreenDialog: true,
  //   );
  //   final newPreferences = await Navigator.of(context).push(route);
  //   if (newPreferences != null) {
  //     setState(() {
  //       _listPreferences = newPreferences;
  //     });
  //   }
  // }
}
