import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import '../../../../stud_advice.dart';

class CustomSearchBar<T> extends StatelessWidget {
  final T controller;
  final stt.SpeechToText _speech = stt.SpeechToText();

  CustomSearchBar({
    super.key,
    required this.controller,
  });

  void _startListening() async {
    bool available = await _speech.initialize(
      onStatus: (val) => print('onStatus: $val'),
      onError: (val) => print('onError: $val'),
    );

    if (available) {
      _speech.listen(
        onResult: (val) {
          if (controller is CategoryController) {
            (controller as CategoryController).textEditingController.text =
                val.recognizedWords;
            (controller as CategoryController).update();
          }
          _speech.stop();
        },
      );
    } else {
      print("The user has denied the use of speech recognition.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClassicTextField(
      onChanged: (value) {
        if (controller is CategoryController) {
          (controller as CategoryController).update();
        }
      },
      controller: (controller as CategoryController).textEditingController,
      hintText: 'Search an administrative process',
      backgroundColor: Colors.transparent,
      borderColor: Colors.black,
      focusedBorderColor: AppColors.secondaryColor,
      inputDecoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.grey,
          size: 26,
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            _startListening();
          },
          child: const Icon(
            Icons.mic,
            color: Colors.blue,
            size: 26,
          ),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelText: "Search an administrative process",
        labelStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        isDense: true,
      ),
    );
  }
}
