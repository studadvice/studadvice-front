import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import '../../../stud_advice.dart';
import '../../models/stud_advice/deals.dart';

class DealDetailScreen extends StatelessWidget {
  static const navigatorId = '/deal_detail_screen';
  final FileController fileController = Get.find();

  @override
  Widget build(BuildContext context) {
    final deal = Get.arguments['deal'] as DealContent;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: <Widget>[
            SizedBox(
              height: size.height * 0.55,
              child: FutureBuilder<String?>(
                future: fileController.downloadFile(deal.imageId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.data != null) {
                    return Image.file(
                      File(snapshot.data!),
                      fit: BoxFit.cover,
                    );
                  } else if (snapshot.hasError) {
                    return const Text('Erreur de chargement de l\'image');
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ),
            Positioned.fill(
              top: size.height * 0.55 - 20,
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: ListView(
                  children: <Widget>[
                    Text(
                      deal.title,
                      style: const TextStyle(
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
                            color: Colors.black,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Text(
                      "Description",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(deal.description),
                    const Spacer(),
                    Align(
                      alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            foregroundColor: Colors.white,
                            textStyle: const TextStyle(
                              fontSize: 20.0,
                                fontWeight: FontWeight.bold
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          onPressed: () {
                            Get.toNamed(deal.url);
                          },
                          child: const Text("Go"),
                        ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
