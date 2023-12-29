import 'package:get/get.dart';
import 'package:stud_advice/stud_advice.dart';

class FavoriteAdministrativeProcessBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<FavoriteAdministrativeProcessController>(
        FavoriteAdministrativeProcessController());
  }
}
