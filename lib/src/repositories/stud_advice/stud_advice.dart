import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:stud_advice/src/repositories/stud_advice/stud_advice_interface.dart';
import '../../models/stud_advice/category.dart';

class StudAdviceRepository implements IStudAdviceRepository {
  final _dio = Get.find<Dio>();
  final String baseUrl = 'http://localhost:8080';

  String _generateToken() {
    return 'eyJhbGciOiJSUzI1NiIsImtpZCI6ImJlNzgyM2VmMDFiZDRkMmI5NjI3NDE2NThkMjA4MDdlZmVlNmRlNWMiLCJ0eXAiOiJKV1QifQ.eyJjdXN0b21fY2xhaW1zIjpbIkFETUlOIl0sImlzcyI6Imh0dHBzOi8vc2VjdXJldG9rZW4uZ29vZ2xlLmNvbS9zdHVkYWR2aWNlLWF1dGgiLCJhdWQiOiJzdHVkYWR2aWNlLWF1dGgiLCJhdXRoX3RpbWUiOjE3MDIyNDgxNzEsInVzZXJfaWQiOiJIUmdScml1ZWY5V3V0cGxsYU0xSGZydlNBcUUyIiwic3ViIjoiSFJnUnJpdWVmOVd1dHBsbGFNMUhmcnZTQXFFMiIsImlhdCI6MTcwMjI0ODE3MSwiZXhwIjoxNzAyMjUxNzcxLCJlbWFpbCI6Im5hZGluZS56aW5lLjdAZ21haWwuY29tIiwiZW1haWxfdmVyaWZpZWQiOmZhbHNlLCJmaXJlYmFzZSI6eyJpZGVudGl0aWVzIjp7ImVtYWlsIjpbIm5hZGluZS56aW5lLjdAZ21haWwuY29tIl19LCJzaWduX2luX3Byb3ZpZGVyIjoicGFzc3dvcmQifX0.LlnQLD3oPLkZ_5x2rieZwzTzajriMhXuIkKG8qykBO2LME_vioTMzox4a2rE3xcBW3npDZRL3Fmoe_NrlaIbOxxhMb8f0LFFxqBauSQGDQgdO0pyZaswIoPJWZ7xGetvuY6XNCoCRenXH3Kkptn_CgrffH2I7t2cWL8bTlHX0XEX_cBtznP8gLY3B6XRqGMNI81MkohWfwcQQ_chbxNgcoIqE6joyZSKekEt1xIS-nsEgEnSt5UAr4OspddyYL92zSXUzv7JHE__v7qosJ1vFZ01LB39IMwql6WATOFJDksmG5zkNh9KwAWTR7JWAElJN86UDYqSO8cxBY9mfCAnTg';
  }

  Future<AdministrativeProcessCategory> _getCategories(
      String path, Map<String, dynamic> queryParameters) async {
    try {
      final response = await _dio.get(
        '$baseUrl/$path',
        queryParameters: queryParameters,
        options: _getOptions(),
      );

      if (response.statusCode == 200) {
        return AdministrativeProcessCategory.fromJson(response.data);
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (error) {
      _handleError(error);
      return Future.error(error);
    }
  }

  Future<AdministrativeProcessCategory> _getCategoriesBySearch(
      String path, Map<String, dynamic> queryParameters) async {
    try {
      final response = await _dio.get(
        '$baseUrl/$path',
        queryParameters: queryParameters,
        options: _getOptions(),
      );

      if (response.statusCode == 200) {
        return AdministrativeProcessCategory.fromJson(response.data);
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (error) {
      _handleError(error);
      return Future.error(error);
    }
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

  @override
  Future<AdministrativeProcessCategory> getCategories({
    required int number,
    required int size,
  }) async {
    final queryParameters = {'page': number, 'size': size};
    return _getCategories('categories', queryParameters);
  }

  @override
  Future<AdministrativeProcessCategory> getCategoriesBySearch({
    required int number,
    required int size,
    required String query,
  }) async {
    final queryParameters = {'page': number, 'size': size, 'searchText': query};
    return _getCategoriesBySearch('administrative-process/search', queryParameters);
  }
}
