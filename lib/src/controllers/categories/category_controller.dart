import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:stud_advice/src/models/stud_advice/category.dart';

class CategoryController extends GetxController {
  final Dio _dio = Get.find<Dio>();
  final String baseUrl = 'http://localhost:8080';

  String _generateToken() {
    return "eyJhbGciOiJSUzI1NiIsImtpZCI6ImJlNzgyM2VmMDFiZDRkMmI5NjI3NDE2NThkMjA4MDdlZmVlNmRlNWMiLCJ0eXAiOiJKV1QifQ.eyJjdXN0b21fY2xhaW1zIjpbIkFETUlOIl0sImlzcyI6Imh0dHBzOi8vc2VjdXJldG9rZW4uZ29vZ2xlLmNvbS9zdHVkYWR2aWNlLWF1dGgiLCJhdWQiOiJzdHVkYWR2aWNlLWF1dGgiLCJhdXRoX3RpbWUiOjE3MDIzMzI1NjYsInVzZXJfaWQiOiJIUmdScml1ZWY5V3V0cGxsYU0xSGZydlNBcUUyIiwic3ViIjoiSFJnUnJpdWVmOVd1dHBsbGFNMUhmcnZTQXFFMiIsImlhdCI6MTcwMjMzMjU2NiwiZXhwIjoxNzAyMzM2MTY2LCJlbWFpbCI6Im5hZGluZS56aW5lLjdAZ21haWwuY29tIiwiZW1haWxfdmVyaWZpZWQiOmZhbHNlLCJmaXJlYmFzZSI6eyJpZGVudGl0aWVzIjp7ImVtYWlsIjpbIm5hZGluZS56aW5lLjdAZ21haWwuY29tIl19LCJzaWduX2luX3Byb3ZpZGVyIjoicGFzc3dvcmQifX0.EYq3VqqyVHAY5gZ1IQpldXKah3EOweaZSRiw3TslHF9cM8OagSHA_C7iwZLMDL3CcMOIx9ZaeB4dpFbVEup6Yef-csY5jCYfWM0M4-z8e4-NPekp499UKEofGeCASvYZ2hucxU0K4igIMAk1e7ZloNHbXG3P-FpfjLD65R-NmJE0CxR9xGGS3QwyIBDb3PxMknw6hs-pvYiopaN9QSfQ1xhx-hHwimXVK94we6G6a6P1uEFoftLFXxULhw3pzZz9IuDBJIknhnFhybrD3n0DPfJQs0cfSQRLSirZjpTWaBasH0ldma6xZhYudLh38440oWxBey4oLv11NcNTcvdJOg";
  }

  Options _getOptions() {
    return Options(
      headers: {
        'content-Type': 'application/json',
        'accept': 'application/json',
        'Authorization': 'Bearer ${_generateToken()}',
      },
    );
  }

  Future<Category> _getCategories(String path, Map<String, dynamic> queryParameters) async {
    try {
      final response = await _dio.get(
        '$baseUrl/$path',
        queryParameters: queryParameters,
        options: _getOptions(),
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

  Future<Category> _getCategoriesBySearch(String path, Map<String, dynamic> queryParameters) async {
    try {
      final response = await _dio.get(
        '$baseUrl/$path',
        queryParameters: queryParameters,
        options: _getOptions(),
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
    return _getCategories('categories', queryParameters);
  }

  Future<Category> getCategoriesBySearch({
    required int number,
    required int size,
    required String query,
  }) async {
    final queryParameters = {'page': number, 'size': size, 'searchText': query};
    return _getCategoriesBySearch('administrative-process/search', queryParameters);
  }
}
