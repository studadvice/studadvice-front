import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../stud_advice.dart';
import '../../controllers/settings/support_controller.dart';

class SupportScreen extends StatelessWidget {
  static const String navigatorId = '/support_screen';

  final SupportController supportController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'support.title'.tr,
          style: const TextStyle(
            fontSize: AppFontSizes.large18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            onPressed: supportController.sendSupportRequest,
            icon: const Icon(Icons.send),
            color: AppColors.primaryColor,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) => supportController.subject.value = value,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelText: 'Subject',
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (value) => supportController.body.value = value,
                  maxLines: null,
                  expands: true,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: InputDecoration(
                    labelText: 'Body',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  for (var i = 0; i < supportController.attachments.length; i++)
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            supportController.attachments[i],
                            softWrap: false,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.remove_circle),
                          onPressed: () =>
                              supportController.removeAttachment(i),
                        )
                      ],
                    ),
                  ElevatedButton(
                    onPressed: _openFilePicker,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                    ),
                    child: const Text(
                      'Attach File',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                  ,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _openFilePicker() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null) {
        String filePath = result.files.single.path ?? '';
        supportController.addAttachment(filePath);
      } else {
        debugPrint('User canceled file picking');
      }
    } catch (e) {
      debugPrint('Error picking a file: $e');
    }
  }

}