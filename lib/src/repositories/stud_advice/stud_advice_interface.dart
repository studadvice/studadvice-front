import '../../models/stud_advice/category.dart';

abstract class IStudAdviceRepository {
  Future<AdministrativeProcessCategory> getCategories({required int number, required int size});
  Future<AdministrativeProcess> getCategoriesBySearch({required int number, required int size, required String query});

  }