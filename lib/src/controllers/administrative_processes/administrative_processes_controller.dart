import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:stud_advice/stud_advice.dart';

class AdministrativeProcessController extends GetxController {
  final RxList<AdministrativeProcess> administrativeProcesses =
      <AdministrativeProcess>[].obs;
  final FileController _fileController = Get.find<FileController>();
  final Dio _dio = Get.find<Dio>();

  Future<void> fetchAdministrativeProcesses(String categoryId) async {
    String baseUrl =
        dotenv.env['BACKEND_BASE_URL'] ?? 'http://localhost:8080.com';

    // FIXME: uncomment this when the correct endpoint is available
    // final response = await Dio()
    //     .get('$baseUrl/categories/$categoryId/administrative-process');
    // if (response.statusCode == HttpStatus.ok) {
    //   List<dynamic> data = response.data['data'];
    //   administrativeProcesses.value =
    //       data.map((json) => AdministrativeProcess.fromJson(json)).toList();
    // } else {
    //   throw Exception('Failed to load administrative processes');
    // }

    // Mocked list of administrative processes
    List<AdministrativeProcess> processes = [
      AdministrativeProcess(
          id: '1',
          name: 'Process 1',
          imageId: 'image_id_1',
          description: 'Description 1'),
      AdministrativeProcess(
          id: '2',
          name: 'Process 2',
          imageId: 'image_id_2',
          description:
              'lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum '),
    ];

    administrativeProcesses.value = processes;

    // For each administrative process, download the image and set the imageFileSrc property
    for (var process in administrativeProcesses) {
      if (process.imageId == null) {
        continue;
      }
      String? imagePath = await _fileController.downloadFile(process.imageId!);
      if (imagePath != null) {
        process.imageFileSrc = imagePath;
      }
    }
  }
}
