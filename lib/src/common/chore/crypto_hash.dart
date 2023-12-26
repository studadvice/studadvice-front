import 'dart:convert';

import 'package:crypto/crypto.dart';

class CryptoHash {
  static String hashValue(String value) {
    var bytes = utf8.encode(value);
    var digest = sha256.convert(bytes);

    return digest.toString();
  }
}
