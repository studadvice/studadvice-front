import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:stud_advice/stud_advice.dart';

class AdministrativeProcessController extends GetxController {
  final RxList<AdministrativeProcess> administrativeProcesses =
      <AdministrativeProcess>[].obs;

  final FileController _fileController = Get.find<FileController>();
  final Dio _dio = Get.find<Dio>();
  final String baseUrl = 'http://localhost:8080';

  String _generateToken() {
    return ".eyJjdXN0b21fY2xhaW1zIjpbIkFETUlOIl0sImlzcyI6Imh0dHBzOi8vc2VjdXJldG9rZW4uZ29vZ2xlLmNvbS9zdHVkYWR2aWNlLWF1dGgiLCJhdWQiOiJzdHVkYWR2aWNlLWF1dGgiLCJhdXRoX3RpbWUiOjE3MDIzMzI1NjYsInVzZXJfaWQiOiJIUmdScml1ZWY5V3V0cGxsYU0xSGZydlNBcUUyIiwic3ViIjoiSFJnUnJpdWVmOVd1dHBsbGFNMUhmcnZTQXFFMiIsImlhdCI6MTcwMjMzMjU2NiwiZXhwIjoxNzAyMzM2MTY2LCJlbWFpbCI6Im5hZGluZS56aW5lLjdAZ21haWwuY29tIiwiZW1haWxfdmVyaWZpZWQiOmZhbHNlLCJmaXJlYmFzZSI6eyJpZGVudGl0aWVzIjp7ImVtYWlsIjpbIm5hZGluZS56aW5lLjdAZ21haWwuY29tIl19LCJzaWduX2luX3Byb3ZpZGVyIjoicGFzc3dvcmQifX0.EYq3VqqyVHAY5gZ1IQpldXKah3EOweaZSRiw3TslHF9cM8OagSHA_C7iwZLMDL3CcMOIx9ZaeB4dpFbVEup6Yef-csY5jCYfWM0M4-z8e4-NPekp499UKEofGeCASvYZ2hucxU0K4igIMAk1e7ZloNHbXG3P-FpfjLD65R-NmJE0CxR9xGGS3QwyIBDb3PxMknw6hs-pvYiopaN9QSfQ1xhx-hHwimXVK94we6G6a6P1uEFoftLFXxULhw3pzZz9IuDBJIknhnFhybrD3n0DPfJQs0cfSQRLSirZjpTWaBasH0ldma6xZhYudLh38440oWxBey4oLv11NcNTcvdJOg";
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

  Future<dynamic> fetchAdministrativeProcesses(
      String categoryId, int number, int size) async {
    List<AdministrativeProcess> processes = [
      AdministrativeProcess(
          id: '1',
          name: 'Process 1',
          imageId: 'image_id_1',
          isFavorite: false,
          description: 'Description 1'),
      AdministrativeProcess(
          id: '2',
          name: 'Process 2',
          imageId: 'image_id_2',
          isFavorite: true,
          description:
              'lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum '
              'lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum '),
      AdministrativeProcess(
          id: '3',
          name: 'Process 1',
          isFavorite: true,
          imageId: 'image_id_1',
          description: 'Description 1'),
      AdministrativeProcess(
          id: '4',
          name: 'Process 2',
          isFavorite: true,
          imageId: 'image_id_2',
          description:
              'lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum'
              ' lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum '),
      AdministrativeProcess(
          id: '5',
          name: 'Process 1',
          imageId: 'image_id_1',
          isFavorite: true,
          description: 'Description 1'),
      AdministrativeProcess(
          id: '6',
          name: 'Process 2',
          imageId: 'image_id_2',
          isFavorite: true,
          description:
              'lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum '
              'lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum '),
    ];

    administrativeProcesses.addAll(processes);

    return {
      'content': processes,
      'last': true,
    };
  }

  void toggleFavoriteState(String administrativeProcessId) {
    final tileIndex = administrativeProcesses
        .indexWhere((process) => process.id == administrativeProcessId);

    if (tileIndex != -1) {
      administrativeProcesses[tileIndex].isFavorite =
          !administrativeProcesses[tileIndex].isFavorite!;
      update();
    }
  }

  bool isFavorite(String administrativeProcessId) {
    final tileIndex = administrativeProcesses
        .indexWhere((process) => process.id == administrativeProcessId);

    return tileIndex != -1 && administrativeProcesses[tileIndex].isFavorite!;
  }
}
