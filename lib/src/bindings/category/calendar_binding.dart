import 'package:get/get.dart';
import 'package:stud_advice/src/controllers/categories/calendar_controller.dart';

class CalendarBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<CalendarController>(CalendarController());
  }
}
