import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'exception_indicator.dart';

class EmptyListIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ExceptionIndicator(
        title: 'empty_result_title'.tr,
        message: 'empty_result_message'.tr,
        assetName: "assets/images/common/raven_image.png",
      );
}
