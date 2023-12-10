abstract class IStudAdviceRepository {
  Future<List<String>> getCategories({required int number, required int size});
}