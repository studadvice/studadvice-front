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
  final bool showProgressBar;
  final Color backgroundColor;

  final AdministrativeProcessController _administrativeProcessController =
      Get.find<AdministrativeProcessController>();
  final FileController fileController = Get.find();
  final RxBool isAnimated = true.obs;

  AdministrativeProcessListTile({
    Key? key,
    required this.administrativeProcessId,
    required this.imageId,
    required this.name,
    required this.description,
    required this.showProgressBar,
    this.backgroundColor = AppColors.white,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO : add navigation to the road map screen
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
                color: AppColors.white,
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.black26,
                    offset: Offset(0, 2),
                    blurRadius: 4.0,
                  ),
                ],
              ),
              child: ListTile(
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
                          valueColor:
                              AlwaysStoppedAnimation<Color>(AppColors.blue),
                        ),
                      )
                    : null,
                trailing: Obx(() {
                  return GestureDetector(
                    onTap: () {
                      _administrativeProcessController
                          .toggleFavoriteState(administrativeProcessId);
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
