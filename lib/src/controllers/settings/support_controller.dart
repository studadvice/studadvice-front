import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import '../../../stud_advice.dart';
import '../../models/firebase/Attachment.dart';

class SupportController extends GetxController {
  final RxString subject = ''.obs;
  final RxString body = ''.obs;
  final RxList<Attachment> attachments = <Attachment>[].obs;
  var firebaseFirestoreInstance = AppDependenciesBinding
      .firebaseFirestoreInstance;

  Future<void> sendSupportRequest() async {
    try {
      if (subject.isEmpty || body.isEmpty) {
        Get.snackbar(
            'support.failure_title'.tr, 'support.failure_message_empty'.tr);
        return;
      }

      if (subject.value.length < 5 || body.value.length < 10) {
        Get.snackbar(
            'support.failure_title'.tr, 'support.failure_message_length'.tr);
        return;
      }

      final attachmentsData = <Map<String, dynamic>>[];

      for (var attachment in attachments) {
        final File file = File(attachment.path.value);

        if (await file.exists()) {
          final bytes = await file.readAsBytes();
          final base64String = base64Encode(bytes);

          attachmentsData.add({
            'filename': attachment.filename.value,
            'content': base64String,
            'encoding': 'base64'
          });
        } else {
          debugPrint('File not found: ${attachment.path.value}');
        }
      }

      final supportData = {
        'to': [dotenv.env["SUPPORT_MAIL"] ?? "studadvice.contact@gmail.com"],
        'message': {
          'subject': subject.value,
          'text': body.value,
          'attachments': attachmentsData,
        }
      };

      await firebaseFirestoreInstance.collection('mail').add(supportData);

      subject.value = '';
      body.value = '';
      attachments.clear();

      Get.snackbar('support.success_title'.tr, 'support.success_message'.tr);
    } catch (error) {
      Get.snackbar(
          'support.failure_title'.tr, 'support.failure_message_generic'.tr);
    }
  }


  void addAttachment(String filename, String path) {
    attachments.add(Attachment(
      filename: filename.obs,
      path: path.obs,
    ));
  }

  void removeAttachment(int index) {
    attachments.removeAt(index);
  }
}