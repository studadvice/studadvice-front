import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../stud_advice.dart';
import '../../models/stud_advice/deals.dart';
import 'dart:io';

class DealItemSlide extends StatelessWidget {
  final DealContent deal;
  final FileController fileController = Get.find();

  DealItemSlide({
    super.key,
    required this.deal,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Stack(
        children: [
          FutureBuilder<String?>(
            future: fileController.downloadFile(deal.imageId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.data != null) {
                return Image.file(
                  File(snapshot.data!),
                  fit: BoxFit.fill,
                );
              } else if (snapshot.hasError) {
                return const Text('Erreur de chargement de l\'image');
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height / 14,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    deal.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      const Icon(
                        Icons.star,
                        color: AppColors.yellow,
                        size: 20,
                      ),
                      Text(
                        deal.rating.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
