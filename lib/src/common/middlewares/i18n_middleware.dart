import 'package:get/get.dart';
import 'package:stud_advice/src/common/controllers/i18n_controller.dart';

class I18nMiddleware extends GetMiddleware {
  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {

    final i18n = Get.find<I18n>();

    if (route.currentTreeBranch.isNotEmpty) {
      String? routeName = route.currentTreeBranch.last.name;
      await i18n.loadTranslations(routeName);
    }

    return super.redirectDelegate(route);
  }
}
