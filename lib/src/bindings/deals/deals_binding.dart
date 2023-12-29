import 'package:get/get.dart';
import 'package:stud_advice/src/controllers/deals/search_deals_controller.dart';

class DealsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SearchDealsController>(SearchDealsController());
  }
}
