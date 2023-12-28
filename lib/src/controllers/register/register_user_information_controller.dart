import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stud_advice/stud_advice.dart';

class RegisterUserInformationController extends GetxController {
  final Dio _dio = Get.find();
  final UserStorageController _userStorageController = Get.find();
  final getLocalStorage = GetStorage();

  static String generateRandomPseudo() {
    final random = Random();
    final words = all.take(10000).toList();

    String pseudo = '';
    for (int i = 0; i < 2; i++) {
      pseudo += words[random.nextInt(words.length)].substring(0, 3);
    }

    pseudo += (random.nextInt(90) + 10)
        .toString(); // Add a random number at the end of the pseudo.

    return pseudo;
  }

  Future<List<CityData>> fetchCitiesFromAPI(String cityName) async {
    try {
      final cityApiUri = Uri.parse(
          'https://geo.api.gouv.fr/communes?nom=$cityName&boost=population');
      final response = await _dio.get(cityApiUri.toString());

      if (response.statusCode == HttpStatus.ok) {
        final List<dynamic> data = response.data;
        final cities = data
            .map((json) => CityData.fromJson(json))
            .where((city) => city.nom != null)
            .toList();
        return cities;
      }
      return [];
    } catch (e) {
      throw Exception('Failed to load cities');
    }
  }

  Future<List<String>> fetchPostalCodesFromApi(String? cityName) async {
    try {
      if (cityName == '') return [];

      final cityApiUri = Uri.parse(
          'https://geo.api.gouv.fr/communes?nom=$cityName&boost=population');
      final response = await _dio.get(cityApiUri.toString());

      if (response.statusCode == HttpStatus.ok) {
        final List<dynamic> data = response.data;
        final cities = data
            .map((json) => CityData.fromJson(json))
            .where((city) => city.nom != null)
            .toList();
        if (cities.isNotEmpty) {
          return cities[0].codesPostaux ??
              []; // Return the first match only postal codes.
        }
      }
      return [];
    } catch (e) {
      throw Exception('Failed to load city postal codes');
    }
  }

  Future<void> saveUserInformation(UserData userData) async {
    LoadingSpinner.start();

    try {
      bool registerSuccess =
          await _userStorageController.saveUserData(userData);

      if (registerSuccess) {
        LoadingSpinner.stop();
        Get.offAllNamed(NavigationBarScreen.navigatorId, arguments: userData);
      }
    } catch (e) {
      LoadingSpinner.stop();
      Get.snackbar(
        "register_user_information_controller.error".tr,
        "register_user_information_controller.registerWithEmailFailed".tr,
        colorText: AppColors.white,
        backgroundColor: AppColors.dangerColor,
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text(
          "register_user_information_controller.error".tr,
          style: const TextStyle(color: AppColors.white),
        ),
      );
    }
  }
}
