import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:stud_advice/src/repositories/stud_advice/stud_advice_interface.dart';
import '../../models/stud_advice/AdministrativeProcessCategory.dart';

class StudAdviceRepository implements IStudAdviceRepository {
  final _dio = Get.find<Dio>();
  final String baseUrl = 'https://localhost:8080';

  @override
  Future<AdministrativeProcessCategory> getCategories({required int number, required int size}) async {
    // try {
    //   final response = await _dio.get(
    //     '$baseUrl/categories',
    //     queryParameters: {'page': number, 'size': size},
    //   );
    //
    //   if (response.statusCode == 200) {
    //     return AdministrativeProcessCategory.fromJson(response.data);
    //   } else {
    //     throw Exception('Failed to load categories');
    //   }
    // } catch (error) {
    //   throw Exception('Failed to connect to the server');
    // }
    // Réponse JSON statique
    String jsonResponse;
    if (number == 0) {
      jsonResponse = '''
{
  "content": [
    {
      "id": "657574b5be94f11bd8d9466f",
      "name": "santé",
      "description": "toto",
      "imageId": "657574b5be94f11bd8d9466d",
      "administrativeProcesses": []
    },
    {
      "id": "657574b5be94f11bd8d9466f",
      "name": "santé",
      "description": "toto",
      "imageId": "657574b5be94f11bd8d9466d",
      "administrativeProcesses": []
    },
    {
      "id": "657574b5be94f11bd8d9466f",
      "name": "santé",
      "description": "toto",
      "imageId": "657574b5be94f11bd8d9466d",
      "administrativeProcesses": []
    },
    {
      "id": "657574b5be94f11bd8d9466f",
      "name": "santé",
      "description": "toto",
      "imageId": "657574b5be94f11bd8d9466d",
      "administrativeProcesses": []
    },
    {
      "id": "657574b5be94f11bd8d9466f",
      "name": "santé",
      "description": "toto",
      "imageId": "657574b5be94f11bd8d9466d",
      "administrativeProcesses": []
    }
  ],
  "pageable": {
    "pageNumber": 0,
    "pageSize": 5,
    "sort": {
      "empty": true,
      "sorted": false,
      "unsorted": true
    },
    "offset": 0,
    "paged": true,
    "unpaged": false
  },
  "totalElements": 10,
  "totalPages": 2,
  "last": false,
  "size": 5,
  "number": 0,
  "sort": {
    "empty": true,
    "sorted": false,
    "unsorted": true
  },
  "numberOfElements": 5,
  "first": true,
  "empty": false
}
''';
    }
    else {
      jsonResponse = '''
{
  "content": [
    {
      "id": "657574b5be94f11bd8d9466f",
      "name": "santé",
      "description": "toto",
      "imageId": "657574b5be94f11bd8d9466d",
      "administrativeProcesses": []
    },
    {
      "id": "657574b5be94f11bd8d9466f",
      "name": "santé",
      "description": "toto",
      "imageId": "657574b5be94f11bd8d9466d",
      "administrativeProcesses": []
    },
    {
      "id": "657574b5be94f11bd8d9466f",
      "name": "santé",
      "description": "toto",
      "imageId": "657574b5be94f11bd8d9466d",
      "administrativeProcesses": []
    },
    {
      "id": "657574b5be94f11bd8d9466f",
      "name": "santé",
      "description": "toto",
      "imageId": "657574b5be94f11bd8d9466d",
      "administrativeProcesses": []
    },
    {
      "id": "657574b5be94f11bd8d9466f",
      "name": "santé",
      "description": "toto",
      "imageId": "657574b5be94f11bd8d9466d",
      "administrativeProcesses": []
    }
  ],
  "pageable": {
    "pageNumber": 0,
    "pageSize": 5,
    "sort": {
      "empty": true,
      "sorted": false,
      "unsorted": true
    },
    "offset": 0,
    "paged": true,
    "unpaged": false
  },
  "totalElements": 10,
  "totalPages": 2,
  "last": true,
  "size": 5,
  "number": 0,
  "sort": {
    "empty": true,
    "sorted": false,
    "unsorted": true
  },
  "numberOfElements": 5,
  "first": false,
  "empty": false
}
''';
    }

    // Décodage du JSON en objet Dart
    final Map<String, dynamic> parsedJson = json.decode(jsonResponse);

    // Création d'une instance de la classe AdministrativeProcessCategory
    final administrativeProcessCategory = AdministrativeProcessCategory.fromJson(parsedJson);

    return administrativeProcessCategory;
  }
}