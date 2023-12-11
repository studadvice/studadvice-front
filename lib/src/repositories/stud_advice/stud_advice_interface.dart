import '../../models/stud_advice/category.dart';

abstract class IStudAdviceRepository {
  Future<Category> getCategories({required int number, required int size});
  Future<Category> getCategoriesBySearch({required int number, required int size, required String query});

  }