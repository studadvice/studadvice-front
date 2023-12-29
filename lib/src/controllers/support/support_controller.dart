import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import '../../../stud_advice.dart';

class SupportController extends GetxController {
  final RxString subject = ''.obs;
  final RxString body = ''.obs;
  final RxList<String> attachments = <String>[].obs;
  var firebaseFirestoreInstance = AppDependenciesBinding.firebaseFirestoreInstance;

  Future<void> sendSupportRequest() async {
    try {
      if (subject.isEmpty || body.isEmpty) {
        Get.snackbar('support.failure_title'.tr, 'support.failure_message_empty'.tr);
        return;
      }

      if (subject.value.length < 5 || body.value.length < 10) {
        Get.snackbar('support.failure_title'.tr, 'support.failure_message_length'.tr);
        return;
      }

      final supportData = {
        'to': [dotenv.env["SUPPORT_MAIL"] ?? "studadvice.contact@gmail.com"],
        'message': {
          'subject': subject.value,
          'html': body.value,
        }
      };

      await firebaseFirestoreInstance.collection('mail').add(supportData);

      subject.value = '';
      body.value = '';

      Get.snackbar('support.success_title'.tr, 'support.success_message'.tr);
    } catch (error) {
      Get.snackbar('support.failure_title'.tr, 'support.failure_message_generic'.tr);
    }
  }
}
