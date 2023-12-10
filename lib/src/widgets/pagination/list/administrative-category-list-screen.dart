import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/src/widgets/pagination/list/administrative-category-paged-list-view.dart';
import '../../../repositories/stud_advice/stud_advice.dart';
import '../preferences/list_preferences.dart';

class AdministrativeCategoryListScreen extends StatefulWidget {
  @override
  _AdministrativeCategoryListScreenState createState() => _AdministrativeCategoryListScreenState();
}

class _AdministrativeCategoryListScreenState extends State<AdministrativeCategoryListScreen> {
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
        body: AdministrativeCategoryPagedListView(
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
