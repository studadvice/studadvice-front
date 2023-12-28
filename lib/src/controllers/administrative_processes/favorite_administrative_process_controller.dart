import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:stud_advice/src/controllers/search/custom_search_controller.dart';
import 'package:stud_advice/stud_advice.dart';

class FavoriteAdministrativeProcessController extends CustomSearchController {
  final RxList<String> _favoritesAdministrativeProcessesId = <String>[].obs;

  UserStorageController userStorageController = Get.find();
  final Dio _dio = Get.find();

  List<String> get favoriteAdministrativeProcessesId =>
      _favoritesAdministrativeProcessesId;

  final pagingController = PagingController<int, AdministrativeProcessContent>(
    firstPageKey: 0,
  );

  @override
  void onInit() {
    super.onInit();
    _initFavorites();
    pagingController.addPageRequestListener((pageKey) {
      fetchFavoritesPage(pageKey);
    });
  }

  @override
  Future<void> fetchFavoritesPage(int pageKey) async {
    try {
      final newPage = await getAdministrativeProcesses(
          number: pageKey, size: 5, query: textEditingController.text);

      final isLastPage = newPage.last;
      final newItems = newPage.content;

      final favoriteAdministrativeProcesses =
          newItems.where((process) => isProcessFavorite(process.id)).toList();

      if (isLastPage) {
        pagingController.appendLastPage(favoriteAdministrativeProcesses);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(
            favoriteAdministrativeProcesses, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }

  Future<AdministrativeProcesses> getAdministrativeProcesses(
      {required int number, required int size, String? query}) async {
    final queryParameters = {
      'page': number,
      'size': size,
      'searchText': query,
    };
    return _getAdministrativeProcesses(
        '/administrative-process/search', queryParameters);
  }

  Future<AdministrativeProcesses> _getAdministrativeProcesses(
      String path, Map<String, dynamic> queryParameters) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
      );

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
    update();
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
