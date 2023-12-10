import 'package:flutter/material.dart';
import '../../../models/stud_advice/AdministrativeProcessCategory.dart';

class CategoryListItem extends StatelessWidget {
  const CategoryListItem({
    required this.category,
    super.key
  });
  final CategoryContent category;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      "test",
                      style: textTheme.titleMedium,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "test",
                style: textTheme.bodyMedium,
              )
            ],
          ),
        ),
      ),
    );
  }
}
