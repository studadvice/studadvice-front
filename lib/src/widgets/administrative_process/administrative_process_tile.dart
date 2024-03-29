import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:stud_advice/stud_advice.dart';

class AdministrativeProcessListTile extends StatelessWidget {
  final String name;
  final String imageId;
  final String administrativeProcessId;
  final String description;
  final Color backgroundColor;
  final List<StepItem> steps;
  final String type;
  final String categoryId;

  final AdministrativeProcessController _administrativeProcessController =
      Get.find<AdministrativeProcessController>();
  final FileController fileController = Get.find();
  final RxBool isAnimated = true.obs;

  AdministrativeProcessListTile({
    Key? key,
    required this.categoryId,
    required this.administrativeProcessId,
    required this.imageId,
    required this.name,
    required this.description,
    required this.steps,
    this.backgroundColor = AppColors.white,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    var showProgressBar = steps.isNotEmpty;
    return GestureDetector(
      onTap: () {
        if (steps.isNotEmpty) {
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
        } else {
          debugPrint("No steps");
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return NoStepsModal(
                  administrativeProcessDescription: description,
                );
              });
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Obx(
          () => SlideTransition(
            position: Tween<Offset>(
              begin: isAnimated.isTrue ? const Offset(-1, 0) : Offset.zero,
              end: Offset.zero,
            ).animate(CurvedAnimation(
              curve: Curves.easeInOut,
              parent: AnimationController(
                vsync: TestVSync(),
                duration: const Duration(milliseconds: 500),
              )..forward(), // Start the animation
            )),
            child: Container(
              margin:
                  const EdgeInsets.symmetric(vertical: 1.0, horizontal: 8.0),
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
              child: Column(
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.all(8.0),
                    leading: Container(
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: AppColors.grey),
                      ),
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
                      ),
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
                          maxLines: 4,
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
                        ? Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: FutureBuilder<double>(
                              future: _administrativeProcessController
                                  .getProgressValue(administrativeProcessId),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  return LinearProgressIndicator(
                                    value: snapshot.data,
                                    backgroundColor: AppColors.grey,
                                    valueColor:
                                        const AlwaysStoppedAnimation<Color>(
                                      AppColors.primaryColor,
                                    ),
                                  );
                                } else {
                                  return const LinearProgressIndicator(
                                    value: 0.0,
                                    backgroundColor: AppColors.grey,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      AppColors.primaryColor,
                                    ),
                                  );
                                }
                              },
                            ),
                          )
                        : null,
                    trailing: Obx(() {
                      return GestureDetector(
                        onTap: () {
                          _administrativeProcessController.toggleFavoriteState(
                              administrativeProcessId, categoryId);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(color: AppColors.grey),
                          ),
                          child: Icon(
                            Icons.favorite,
                            color: _administrativeProcessController
                                    .isProcessFavorite(administrativeProcessId)
                                ? AppColors.red
                                : AppColors.black,
                            size: 20.0,
                          ),
                        ),
                      );
                    }),
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
                          type,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TestVSync extends TickerProvider {
  @override
  Ticker createTicker(TickerCallback onTick) {
    return Ticker(onTick);
  }
}
