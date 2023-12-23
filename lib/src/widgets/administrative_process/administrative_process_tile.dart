import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/stud_advice.dart';
import 'dart:io';

class AdministrativeProcessListTile extends StatelessWidget {
  final String name;
  final String imageId;
  final String administrativeProcessId;
  final String description;
  final bool showProgressBar;
  final bool isFavorite;

  final SearchAdministrativeProcessController _controller =
      Get.find<SearchAdministrativeProcessController>();
  final FileController fileController = Get.find();

  AdministrativeProcessListTile(
      {Key? key,
      required this.imageId,
      required this.name,
      required this.description,
      required this.showProgressBar,
      required this.administrativeProcessId,
      required this.isFavorite});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO : add navigation to the administrative process screen
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 8.0),
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
          contentPadding: const EdgeInsets.all(10.0),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Container(
              padding: const EdgeInsets.all(5.0),
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: AppColors.white,
                    offset: Offset(2, 2), // Bottom-right shadow
                    blurRadius: 4.0,
                  ),
                  BoxShadow(
                    color: AppColors.white,
                    offset: Offset(-2, 2), // Bottom-left shadow
                    blurRadius: 4.0,
                  ),
                  BoxShadow(
                    color: AppColors.black26,
                    offset: Offset(2, -2), // Top-right shadow
                    blurRadius: 4.0,
                  ),
                  BoxShadow(
                    color: AppColors.white,
                    offset: Offset(-2, -2), // Top-left shadow
                    blurRadius: 4.0,
                  ),
                ],
              ),
              child:  FutureBuilder<String?>(
                future: fileController.downloadFile(imageId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.data != null) {
                    return Image.file(
                        File(snapshot.data!),
                        width: 50,
                        height: 50,
                    );
                  } else if (snapshot.hasError) {
                    return const Text('Erreur de chargement de l\'image');
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              )
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
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  color: AppColors.grey,
                  fontSize: AppFontSizes.medium,
                  fontWeight: FontWeight.bold,
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
                    valueColor: AlwaysStoppedAnimation<Color>(AppColors.blue),
                  ),
                )
              : null,
          trailing: Obx(() {
            return GestureDetector(
              onTap: () {
                _controller.toggleFavoriteState(administrativeProcessId);
                debugPrint('Favorite button tapped');
                debugPrint(
                    "isFavorite: ${_controller.isFavorite(administrativeProcessId)}");
              },
              child: Container(
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: AppColors.grey),
                ),
                child: Icon(
                  Icons.favorite,
                  color: _controller.isFavorite(administrativeProcessId)
                      ? AppColors.red
                      : AppColors.black,
                  size: 20.0,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
