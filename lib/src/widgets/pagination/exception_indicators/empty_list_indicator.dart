import 'package:flutter/cupertino.dart';
import 'exception_indicator.dart';

class EmptyListIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) => const ExceptionIndicator(
        title: 'Too much filtering',
        message: 'We couldn\'t find any results matching your applied filters.',
        assetName: 'assets/images/common/raven_image.png',
      );
}
