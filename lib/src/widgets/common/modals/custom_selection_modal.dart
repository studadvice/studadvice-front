import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/stud_advice.dart';


class CustomSelectionModal extends StatelessWidget {
  final List<String> itemsList;
  final String? defaultChoice;
  final String hintText;
  final String labelText;
  final Function(String) onItemSelected;
  final TextEditingController controller;
  final String searchHintText;
  final String? Function(String?)? validator;
  final double height;

  CustomSelectionModal({
    required this.itemsList,
    this.defaultChoice,
    required this.onItemSelected,
    required this.hintText,
    required this.labelText,
    required this.controller,
    this.height = 300,
    required this.searchHintText,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final customSelectionModalController =
        Get.put(CustomSelectionModalController(itemsList));

    return ClassicTextField(
      hintText: hintText,
      labelText: labelText,
      controller: controller,
      backgroundColor: AppColors.white,
      focusedBorderColor: AppColors.primaryColor,
      borderColor: AppColors.primaryColor,
      keyboardType: TextInputType.none,
      suffixIcon: const Icon(Icons.arrow_drop_down),
      validator: validator,
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (BuildContext context) {
            return SizedBox(
              height: height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClassicTextField(
                      hintText: searchHintText,
                      controller:
                          customSelectionModalController.searchController,
                      backgroundColor: AppColors.white,
                      focusedBorderColor: AppColors.primaryColor,
                      borderColor: AppColors.primaryColor,
                      onChanged: (value) {
                        customSelectionModalController.filterItems(value);
                      },
                      suffixIcon: const Icon(Icons.search),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: Obx(
                      () => ListView.builder(
                        itemCount:
                            customSelectionModalController.filteredItems.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18.0, vertical: 2.0),
                              child: Text(customSelectionModalController
                                  .filteredItems[index]),
                            ),
                            onTap: () {
                              onItemSelected(customSelectionModalController
                                  .filteredItems[index]);
                              Get.back();
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
