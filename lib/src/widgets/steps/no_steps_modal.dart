import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/stud_advice.dart';

class NoStepsModal extends StatelessWidget {
  final String administrativeProcessDescription;

  const NoStepsModal({
    Key? key,
    required this.administrativeProcessDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: Center(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                margin: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 15, top: 15),
                decoration: BoxDecoration(
                  color: AppColors.blue50.withOpacity(0.80),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    const BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 1),
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            "no_steps_modal.title".tr,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.close,
                            color: AppColors.white,
                            size: 30,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                    const Divider(
                      color: AppColors.white,
                      thickness: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        'no_steps_modal.description'.tr,
                        style: const TextStyle(
                          fontSize: 16,
                          color: AppColors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Icon(
                      Icons.info,
                      color: AppColors.white,
                      size: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        administrativeProcessDescription,
                        style: const TextStyle(
                          fontSize: 16,
                          color: AppColors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
