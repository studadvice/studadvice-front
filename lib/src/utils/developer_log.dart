import 'dart:developer' as dev;

import 'package:logger/logger.dart';

class DeveloperLog extends LogOutput {
  @override
  void output(OutputEvent event) {
    event.lines.forEach(dev.log);
  }
}
