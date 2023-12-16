import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/stud_advice/category.dart';
import '../../screens/administrative_processes/AdministrativeProcessesScreen.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem({
    required this.category,
    super.key,
  });

  final CategoryContent category;
  final RxBool _isLongPress = false.obs;


  @override
  Widget build(BuildContext context) {
    Color cardColor = Color(int.parse(category.color, radix: 16) + 0xFF000000);

    return GestureDetector(
      onLongPress: () {
        _isLongPress.value = true;
      },
      onTap: () {
        if (_isLongPress.value) {
          _isLongPress.value = false;
        } else {
          Get.toNamed(
            AdministrativesProcessesScreen.navigatorId,
            arguments: {
                'categoryId':
                category.id,
                'categoryColor':
                category.color
            },
          );
        }
      },
      child:
        Card(
            color: cardColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        category.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${category.administrativeProcesses!.length} démarches ',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      )
                      ]
                    )
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end, // Align to the right
                    children: [
                      Image(
                        image: AssetImage('assets/images/common/raven_image.png'),
                        height: 100,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
