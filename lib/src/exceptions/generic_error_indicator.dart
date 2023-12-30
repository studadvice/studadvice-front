import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'exception_indicator.dart';

class GenericErrorIndicator extends StatelessWidget {
  const GenericErrorIndicator({
    super.key,
    this.onTryAgain,
  });

  final VoidCallback? onTryAgain;

  @override
  Widget build(BuildContext context) => ExceptionIndicator(
        title: 'general_error_title'.tr,
        message: 'general_error_message'.tr,
        assetName: 'assets/images/common/raven_image.png',
        onTryAgain: onTryAgain,
      );
}
