import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/src/controllers/controllers.dart';

class I18nMiddleware extends GetMiddleware {

  @override
  RouteSettings? redirect(String? route) {
    debugPrint('I18nMiddleware: redirect to $route');

    // final i18n = Get.find<I18n>();
    //
    // if (route != null) {
    //   i18n.loadTranslations(route);
    // }

    return super.redirect(route);
  }

  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
    debugPrint('I18nMiddleware: redirectDelegate to ${route.currentTreeBranch.last.name}');

    // final i18n = Get.find<I18n>();
    //
    // if (route.currentTreeBranch.isNotEmpty) {
    //   String? routeName = route.currentTreeBranch.last.name;
    //   await i18n.loadTranslations(routeName);
    // }

    return super.redirectDelegate(route);
  }
}
