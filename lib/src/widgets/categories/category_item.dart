import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../stud_advice.dart';
import '../../models/stud_advice/categories.dart';
import 'dart:io';

class CategoryItem extends StatelessWidget {
  CategoryItem({
    required this.category,
    super.key,
  });

  final CategoryContent category;
  final RxBool _isLongPress = false.obs;
  final FileController fileController = Get.find();

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
              'categoryId': category.id,
              'categoryColor': category.color
            },
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 4.0,
              spreadRadius: .05,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder<String?>(
              future: fileController.downloadFile(category.imageId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.data != null) {
                  return Align(
                    alignment: Alignment.center,
                    child: Image.file(
                      File(snapshot.data!),
                      height: 120,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return const Text('Erreur de chargement de l\'image');
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Text(category.name),
            Text(
              "${category.administrativeProcesses!.length} démarches",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
