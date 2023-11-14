import 'package:flutter/material.dart';
import 'package:stud_advice/src/common/chore/app_colors.dart';
import 'package:stud_advice/src/widgets/textFields/classic_text_field.dart';

class CustomSelectionModal extends StatefulWidget {
  final List<String> itemsList;
  final String defaultChoice;
  final String hintText;
  final String labelText;
  final Function(String) onItemSelected;
  final TextEditingController controller;
  final String searchHintText;
  final double height;

  CustomSelectionModal({
    required this.itemsList,
    required this.defaultChoice,
    required this.onItemSelected,
    required this.hintText,
    required this.labelText,
    required this.controller,
    this.height = 300,
    required this.searchHintText,
  });

  @override
  State<CustomSelectionModal> createState() => _CustomSelectionModalState();
}

class _CustomSelectionModalState extends State<CustomSelectionModal> {
  late String selectedValue;
  late List<String> _filteredItems;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedValue = widget.defaultChoice;
    _filteredItems = List<String>.from(widget.itemsList);
    searchController.addListener(() {
      _filterItems(searchController.text);
    });
  }

  @override
  void dispose() {
    // searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClassicTextField(
      hintText: widget.hintText,
      labelText: widget.labelText,
      controller: widget.controller,
      backgroundColor: AppColors.white,
      focusedBorderColor: AppColors.secondaryColor,
      borderColor: AppColors.secondaryColor,
      keyboardType: TextInputType.none,
      suffixIcon: const Icon(Icons.arrow_drop_down),
      onTap: () {
        _showSelectionModal(context);
      },
    );
  }

  void _showSelectionModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SizedBox(
          height: widget.height,
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClassicTextField(
                hintText: widget.searchHintText,
                controller: searchController,
                backgroundColor: AppColors.white,
                focusedBorderColor: AppColors.secondaryColor,
                borderColor: AppColors.secondaryColor,
                onChanged: (value) {
                  _filterItems(value);
                },
                suffixIcon: const Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(_filteredItems[index]),
                    onTap: () {
                      setState(() {
                        selectedValue = _filteredItems[index];
                      });
                      widget.onItemSelected(_filteredItems[index]);
                      Navigator.pop(context, _filteredItems[index]);
                    },
                  );
                },
              ),
            ),
          ]),
        );
      },
    );
  }

  void _filterItems(String filter) {
    List<String> result = [];
    if (filter.isEmpty) {
      result = widget.itemsList;
    } else {
      result = widget.itemsList
          .where((item) => item.toLowerCase().contains(filter.toLowerCase()))
          .toList();
    }
    setState(() {
      _filteredItems = result;
    });
  }
}
