import 'package:get/get.dart';
import 'package:stud_advice/src/controllers/controllers.dart';

import '../../controllers/categories/category_list_controller.dart';

class CategoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<CategoryController>(CategoryController());
    Get.put<CategoriesListController>(CategoriesListController());
  }
}
