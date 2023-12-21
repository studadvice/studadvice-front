import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:stud_advice/src/controllers/search/custom_search_controller.dart';
import '../../models/stud_advice/administrative_process.dart';

class SearchAdministrativeProcessController extends CustomSearchController {
  final RxList<AdministrativeProcessContent> administrativeProcesses =
      <AdministrativeProcessContent>[].obs;

  final pagingController = PagingController<int, AdministrativeProcessContent>(
    firstPageKey: 0,
  );

  final Dio _dio = Get.find();

  @override
  void onInit() {
    super.onInit();
    pagingController.addPageRequestListener((pageKey) {
      fetchPage(pageKey);
    });
  }

  @override
  Future<void> fetchPage(int pageKey) async {
    try {
      final newPage = await getAdministrativeProcesses(
        number: pageKey,
        size: 5,
        query: textEditingController.text,
      );

      final isLastPage = newPage.last;
      final newItems = newPage.content;
      if (isLastPage) {
        pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }

  Future<AdministrativeProcess> getAdministrativeProcesses({
    required int number,
    required int size,
    String? query,
  }) async {
    final queryParameters = {'page': number, 'size': size, 'searchText': query};
    return _getAdministrativeProcesses('/administrative-process/search', queryParameters);
  }

  Future<AdministrativeProcess> _getAdministrativeProcesses(
      String path, Map<String, dynamic> queryParameters) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
      );

      if (response.statusCode == HttpStatus.ok) {
        return AdministrativeProcess.fromJson(response.data);
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (error) {
      rethrow;
    }
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

  @override
  void onClose() {
    pagingController.dispose();
    super.onClose();
  }

  @override
  void refresh() {
    pagingController.refresh();
  }

}
