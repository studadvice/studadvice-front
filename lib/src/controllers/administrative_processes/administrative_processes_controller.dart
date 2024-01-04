import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:stud_advice/src/controllers/search/custom_search_controller.dart';
import 'package:stud_advice/stud_advice.dart';

class AdministrativeProcessController extends CustomSearchController {
  final RxList<String> _favoritesAdministrativeProcessesId = <String>[].obs;

  UserStorageController userStorageController = Get.find();
  final Dio _dio = Get.find();

  late String categoryId;

  List<String> get favoriteAdministrativeProcesses =>
      _favoritesAdministrativeProcessesId;

  final pagingController = PagingController<int, AdministrativeProcessContent>(
    firstPageKey: 0,
  );

  @override
  void onInit() {
    super.onInit();
    pagingController.addPageRequestListener((pageKey) {
      fetchPage(pageKey);
    });
    _initFavorites();
  }

  @override
  Future<void> fetchPage(int pageKey) async {
    try {
      final AdministrativeProcesses newPage = await getAdministrativeProcesses(
          number: pageKey,
          size: 5,
          query: textEditingController.text,
          categoryId: categoryId);

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

  Future<AdministrativeProcesses> getAdministrativeProcesses(
      {required int number,
      required int size,
      String? query,
      String? categoryId}) async {
    final queryParameters = {
      'page': number,
      'size': size,
      'searchText': query,
      'categoryId': categoryId
    };
    return _getAdministrativeProcesses(
        '/administrative-process', queryParameters);
  }

  Future<AdministrativeProcesses> _getAdministrativeProcesses(
      String path, Map<String, dynamic> queryParameters) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
      );
      print("response.statusCode ${response.statusCode} ${response.data}");
      if (response.statusCode == HttpStatus.ok) {
        return AdministrativeProcesses.fromJson(response.data);
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<void> toggleFavoriteState(String administrativeProcessId) async {
    String userId = userStorageController.getCurrentUserId();

    if (isProcessFavorite(administrativeProcessId)) {
      await userStorageController.removeAdministrativeProcessFromFavorites(
          userId, administrativeProcessId);
      _favoritesAdministrativeProcessesId.remove(administrativeProcessId);
    } else {
      await userStorageController.addAdministrativeProcessToFavorites(
          userId, administrativeProcessId);
      _favoritesAdministrativeProcessesId.add(administrativeProcessId);
    }
  }

  Future<void> _initFavorites() async {
    String userId = userStorageController.getCurrentUserId();

    List<String> favoriteIds = await userStorageController.getFavorites(userId);

    _favoritesAdministrativeProcessesId.addAll(favoriteIds);
  }

  bool isProcessFavorite(String administrativeProcessId) {
    return _favoritesAdministrativeProcessesId
        .any((processId_) => processId_ == administrativeProcessId);
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
