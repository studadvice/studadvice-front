import 'dart:math';

import 'package:english_words/english_words.dart';

class RegisterUserInformationService {
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
}
