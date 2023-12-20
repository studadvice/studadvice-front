import 'package:flutter/material.dart';
import '../../../../stud_advice.dart';

class CustomSearchBar extends StatelessWidget {

  CustomSearchBar({
    required this.textEditingController,
    super.key,
  });

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return ClassicTextField(
      controller: textEditingController,
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
        suffixIcon: const Icon(
          Icons.mic,
          color: Colors.blue,
          size: 26,
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
