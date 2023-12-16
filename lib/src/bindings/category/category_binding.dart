import 'package:get/get.dart';
import 'package:stud_advice/src/controllers/categories/category_controller.dart';

class Category implements Bindings {
  @override
  void dependencies() {
    Get.put<CategoryController>(CategoryController());
  }
}
