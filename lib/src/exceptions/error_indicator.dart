import 'dart:io';

import 'package:flutter/material.dart';

import 'generic_error_indicator.dart';
import 'no_connection_indicator.dart';

class ErrorIndicator extends StatelessWidget {
  const ErrorIndicator({
    required this.error,
    this.onTryAgain,
    super.key,
  })  : assert(error != null);

  final dynamic error;
  final VoidCallback? onTryAgain;

  @override
  Widget build(BuildContext context) => error is SocketException
      ? NoConnectionIndicator(
          onTryAgain: onTryAgain,
        )
      : GenericErrorIndicator(
          onTryAgain: onTryAgain,
        );
}
