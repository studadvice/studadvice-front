import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:english_words/english_words.dart';

import '../../../../../common/conf/injection_container.dart';
import '../../../models/city_data.dart';

class RegisterUserInformationService {
  final _dio = locator<Dio>();

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
}
