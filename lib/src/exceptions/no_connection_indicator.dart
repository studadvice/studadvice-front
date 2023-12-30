import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'exception_indicator.dart';

class NoConnectionIndicator extends StatelessWidget {
  const NoConnectionIndicator({
    super.key,
    this.onTryAgain,
  });

  final VoidCallback? onTryAgain;

  @override
  Widget build(BuildContext context) => ExceptionIndicator(
        title: 'no_connection_indicator_title'.tr,
        message: 'no_connection_indicator_message'.tr,
        assetName: 'assets/images/common/raven_image.png',
        onTryAgain: onTryAgain,
      );
}
