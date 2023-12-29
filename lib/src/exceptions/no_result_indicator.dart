import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'exception_indicator.dart';

class NoResultIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ExceptionIndicator(
    title: 'no_result_title'.tr,
    message: 'no_result_message'.tr,
    assetName: "assets/images/common/raven_image.png",
  );
}
