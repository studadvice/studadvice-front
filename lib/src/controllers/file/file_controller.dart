import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stud_advice/src/models/stud_advice/custom_file.dart';

class FileController extends GetxController {
  final Dio _dio = Get.find();

  Future<String?> downloadFile(String fileId) async {
    try {
      final response = await _dio.get(
        '/download/$fileId',
      );
      if (response.statusCode == HttpStatus.ok) {
        CustomFile customFile = CustomFile.fromJson(response.data);
        Directory appDocDir = await getApplicationDocumentsDirectory();
        String filePath = '${appDocDir.path}/${customFile.filename}';
        File file = File(filePath);
        List<int> bytes = base64Decode(customFile.fileContent!);
        await file.writeAsBytes(bytes);
        return filePath;
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (error) {
      rethrow;
    }
  }
}
