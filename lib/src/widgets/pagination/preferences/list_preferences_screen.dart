import 'package:flutter/material.dart';
import 'package:stud_advice/src/repositories/stud_advice/stud_advice.dart';
import 'package:stud_advice/src/widgets/pagination/preferences/list_preferences.dart';

class ListPreferencesScreen extends StatefulWidget {
  const ListPreferencesScreen({
    required this.repository,
    this.preferences,
    super.key,
  });

  final StudAdviceRepository repository;
  final ListPreferences? preferences;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }

  // @override
  // _ListPreferencesScreenState createState() => _ListPreferencesScreenState();
}