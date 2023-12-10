import 'package:stud_advice/src/repositories/stud_advice/stud_advice_interface.dart';

class StudAdviceRepository implements IStudAdviceRepository {
  @override
  Future<List<String>> getCategories({required int number, required int size}) async {
    final List<String> staticCategories = [
      'Category 1',
      'Category 2',
      'Category 3',
    ];
    return staticCategories;
  }
}