import 'package:flutter/cupertino.dart';

import 'exception_indicator.dart';

class NoConnectionIndicator extends StatelessWidget {
  const NoConnectionIndicator({
    super.key,
    this.onTryAgain,
  });

  final VoidCallback? onTryAgain;

  @override
  Widget build(BuildContext context) => ExceptionIndicator(
        title: 'No connection',
        message: 'Please check internet connection and try again.',
        assetName: 'assets/frustrated-face.png',
        onTryAgain: onTryAgain,
      );
}
