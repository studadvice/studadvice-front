import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:stud_advice/stud_advice.dart';

class AdministrativeProcessController extends GetxController {
  final RxList<AdministrativeProcess> administrativeProcesses =
      <AdministrativeProcess>[].obs;

  final pagingController = PagingController<int, AdministrativeProcess>(
    firstPageKey: 0,
  );

  @override
  void onInit() {
    super.onInit();
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  Future<void> _fetchPage(int pageKey) async {
    int size = 5;
    try {
      final newPage = await fetchAdministrativeProcesses(
        '1',
        pageKey,
        size,
      );

      final isLastPage = newPage['last'] as bool;
      final newItems = newPage['content'] as List<AdministrativeProcess>;
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
