import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'exception_indicator.dart';

class EmptyListIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ExceptionIndicator(
        title: 'Too much filtering',
        message: 'empty_result_message'.tr,
        assetName: "assets/images/common/raven_image.png",
      );
}
