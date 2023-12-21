import 'package:get/get.dart';
import 'package:stud_advice/src/controllers/controllers.dart';

class CategoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SearchCategoryController>(SearchCategoryController());
  }
}
