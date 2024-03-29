import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/stud_advice.dart';

class FavoriteAdministrativeProcessListTile extends StatelessWidget {
  final String name;
  final String imageId;
  final String categoryId;
  final String administrativeProcessId;
  final String description;
  final bool showProgressBar;
  final Color backgroundColor;
  final String type;
  final List<StepItem> steps;

  final FavoriteAdministrativeProcessController
      _favoriteAdministrativeProcessController =
      Get.find<FavoriteAdministrativeProcessController>();
  final FileController fileController = Get.find();

  FavoriteAdministrativeProcessListTile({
    Key? key,
    required this.administrativeProcessId,
    required this.imageId,
    required this.name,
    required this.description,
    required this.showProgressBar,
    required this.steps,
    required this.categoryId,
    this.backgroundColor = AppColors.white,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          RoadMapScreen.navigatorId,
          arguments: {
            'administrativeProcessId': administrativeProcessId,
            'administrativeProcessName': name,
            'administrativeProcessDescription': description,
            'steps': steps,
            'categoryId': categoryId
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
            margin: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 8.0),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width - 16.0,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: const [
                BoxShadow(
                  color: AppColors.black26,
                  offset: Offset(0, 2),
                  blurRadius: 4.0,
                ),
              ],
            ),
            child: Column(children: [
              ListTile(
                contentPadding: const EdgeInsets.all(8.0),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Container(
                      padding: const EdgeInsets.all(5.0),
                      child: FutureBuilder<String?>(
                        future: fileController.downloadFile(imageId),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                                  ConnectionState.done &&
                              snapshot.data != null) {
                            return Image.file(
                              File(snapshot.data!),
                              width: 50,
                              height: 50,
                            );
                          } else if (snapshot.hasError) {
                            return const Icon(
                              Icons.error_outline_sharp,
                              size: 50.0,
                            );
                          } else {
                            return const Icon(Icons.image);
                          }
                        },
                      )),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: AppFontSizes.large18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontSize: AppFontSizes.medium,
                        fontWeight: FontWeight.bold,
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ),
                subtitle: showProgressBar
                    ? const Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: LinearProgressIndicator(
                          value: 0.5,
                          backgroundColor: AppColors.grey,
                          valueColor: AlwaysStoppedAnimation<Color>(
                              AppColors.primaryColor),
                        ),
                      )
                    : null,
                trailing: GestureDetector(
                  onTap: () {
                    _favoriteAdministrativeProcessController
                        .toggleFavoriteState(
                            administrativeProcessId, categoryId);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: AppColors.grey),
                    ),
                    child: const Icon(
                      Icons.remove,
                      color: AppColors.red,
                      size: 20.0,
                    ),
                  ),
                ),
              ),
              if (type.isNotEmpty)
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    margin: const EdgeInsets.all(8.0),
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: AppColors.secondaryColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text(
                      type!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                )
            ])),
      ),
    );
  }
}
