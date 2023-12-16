import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:stud_advice/src/models/stud_advice/category.dart';

class CategoryController extends GetxController {
  final Dio _dio = Get.find();

  Future<Category> _getCategories(String path, Map<String, dynamic> queryParameters) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
      );

      if (response.statusCode == 200) {
        return Category.fromJson(response.data);
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (error) {
      print(error);
      rethrow;
    }
  }

  Future<Category> _getCategoriesBySearch(String path, Map<String, dynamic> queryParameters) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
      );

      if (response.statusCode == 200) {
        return Category.fromJson(response.data);
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<Category> getCategories({required int number, required int size}) async {
    final queryParameters = {'page': number, 'size': size};
    return _getCategories('/categories', queryParameters);
  }

  Future<Category> getCategoriesBySearch({
    required int number,
    required int size,
    required String query,
  }) async {
    final queryParameters = {'page': number, 'size': size, 'searchText': query};
    return _getCategoriesBySearch('/administrative-process/search', queryParameters);
  }
}
