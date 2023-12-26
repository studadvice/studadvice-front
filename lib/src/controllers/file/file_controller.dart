import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class FileController extends GetxController {
  final Dio _dio = Get.find();

  Future<String?> downloadFile(String fileId) async {
    String baseUrl = 'http://localhost:8080';
        // dotenv.env['BACKEND_BASE_URL'] ?? 'http://localhost:8080.com';
    try {
      final response = await _dio.get(
        '$baseUrl/download/$fileId',
        options: Options(responseType: ResponseType.bytes),
      );

      Directory appDocDir = await getApplicationDocumentsDirectory();

      String filePath = '${appDocDir.path}/$fileId.png';

      File file = File(filePath);
      await file.writeAsBytes(response.data);

      return filePath;
    } catch (error) {
      debugPrint('Erreur lors du téléchargement : $error');
      Get.snackbar(
          'Erreur', 'Une erreur s\'est produite lors du téléchargement');
      return null;
    }
  }
}
