import 'package:get/get.dart';
import 'package:stud_advice/stud_advice.dart';

class AdministrativeProcessBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SearchAdministrativeProcessController>(SearchAdministrativeProcessController());
  }
}
