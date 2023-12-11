import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:stud_advice/src/models/stud_advice/category.dart';

class CategoryController extends GetxController {
  final Dio _dio = Get.find<Dio>();
  final String baseUrl = 'http://localhost:8080';

  String _generateToken() {
    return "eyJhbGciOiJSUzI1NiIsImtpZCI6ImJlNzgyM2VmMDFiZDRkMmI5NjI3NDE2NThkMjA4MDdlZmVlNmRlNWMiLCJ0eXAiOiJKV1QifQ.eyJjdXN0b21fY2xhaW1zIjpbIkFETUlOIl0sImlzcyI6Imh0dHBzOi8vc2VjdXJldG9rZW4uZ29vZ2xlLmNvbS9zdHVkYWR2aWNlLWF1dGgiLCJhdWQiOiJzdHVkYWR2aWNlLWF1dGgiLCJhdXRoX3RpbWUiOjE3MDIzMDQ1NjEsInVzZXJfaWQiOiJIUmdScml1ZWY5V3V0cGxsYU0xSGZydlNBcUUyIiwic3ViIjoiSFJnUnJpdWVmOVd1dHBsbGFNMUhmcnZTQXFFMiIsImlhdCI6MTcwMjMwNDU2MSwiZXhwIjoxNzAyMzA4MTYxLCJlbWFpbCI6Im5hZGluZS56aW5lLjdAZ21haWwuY29tIiwiZW1haWxfdmVyaWZpZWQiOmZhbHNlLCJmaXJlYmFzZSI6eyJpZGVudGl0aWVzIjp7ImVtYWlsIjpbIm5hZGluZS56aW5lLjdAZ21haWwuY29tIl19LCJzaWduX2luX3Byb3ZpZGVyIjoicGFzc3dvcmQifX0.gtDcP8yqCnYqA6dkHK6msyCqd5yN7MehqJI4J2qyp-dM3Qp4IFZodj16JTmIdBNgdpPp-cdMPVVYdLG1cijsugjm1-JxPCePwUljkRiJ3LKSRcSm7iNWD0VvRVUMRdiUgaPMavafpFo3_dhWgWh8Et9-CeCW-8EKt9hDIS4GPJIrNs4_pbZwP_VpbfMDMNGOcLFlTOZrnETZR337GHtRm4XCfutS37epEP77KcBIjnwW3CJ0R2G79rMedqQByHNFaHX60BFNwi4qDqDLbKi1y6FptK0P2Gm0jJffL6FmDnWQHZH7kuXLS-ksylRKgNw0AAuNtgRmvYx2iJneZk0wwg";
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

  void _handleError(dynamic error) {
    print('Error: $error');
    if (error is DioError) {
      print('DioError: ${error.response?.data}');
    }
    throw Exception('Failed to connect to the server');
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
      _handleError(error);
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
      _handleError(error);
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
