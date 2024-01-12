import 'package:flutter/material.dart';
import 'package:stud_advice/src/common/chore.dart';
import 'package:stud_advice/src/models/stud_advice/faq.dart';

class FaqItem extends StatelessWidget {
  FaqItem({
    required this.faqItem,
    super.key,
  });

  final FaqContent faqItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        iconColor: AppColors.secondaryColor,
        collapsedIconColor: AppColors.secondaryColor,
        controlAffinity: ListTileControlAffinity.leading,
        childrenPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        expandedCrossAxisAlignment: CrossAxisAlignment.end,
        title: Text(faqItem.question),
        // Expanded Contents
        children: [
          ListTile(title: Text(faqItem.response)),
        ],
      ),
    );
  }
}
