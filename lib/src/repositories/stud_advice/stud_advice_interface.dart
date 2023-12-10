import '../../models/stud_advice/AdministrativeProcessCategory.dart';

abstract class IStudAdviceRepository {
  Future<AdministrativeProcessCategory> getCategories({required int number, required int size});
}