import 'dart:convert';
import 'package:crypto/crypto.dart';

class Security{

  static const String salt = 'EIpWsyfiy@R@X#qn17!StJNdZK1fFF8iV6ffN!goZkqt#JxO'; // 加盐

  /// SHA256
  static String duSHA256(String input) {
    final bytes = utf8.encode(input + salt);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

}