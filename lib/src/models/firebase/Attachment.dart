import 'package:get/get_rx/src/rx_types/rx_types.dart';

class Attachment {
  final RxString filename;
  final RxString path;

  Attachment({
    required this.filename,
    required this.path,
  });
}